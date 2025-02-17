%% Load Data
load('Alvar_v16.mat');

%% Define Bone Indices (from `tissueNames`)
boneIndices = uint8([11, 17, 71]);  % Keep as uint8 to match voxelData type

%% Process in Slices (Memory Efficient)
fprintf('Processing voxel data in slices...\n');

for sliceIdx = 1:size(voxelData, 3) % Iterate over Z slices
    voxelSlice = voxelData(:, :, sliceIdx); % Extract one slice
    
    % Keep only bone indices, set everything else to 0 (fastest method)
    voxelSlice(~(voxelSlice == boneIndices(1) | ...
                 voxelSlice == boneIndices(2) | ...
                 voxelSlice == boneIndices(3))) = 0;
    
    % Replace back into voxelData (modifying in-place)
    voxelData(:, :, sliceIdx) = voxelSlice;
    
    if mod(sliceIdx, 100) == 0
        fprintf('Processed %d/%d slices...\n', sliceIdx, size(voxelData, 3));
    end
end
fprintf('Processing complete!\n');

%% Downscale for Faster Rendering (Optional - Keep `uint8`)
coarseData = voxelData(1:2:end, 1:2:end, 1:2:end); 
coarseVoxelSize = 2 * voxelSize;  % Adjust voxel size accordingly

%% Fix Colormap (Ensure Compatibility with volshow)
fixedCmap = interp1(linspace(0, 1, size(cmap, 1)), cmap, linspace(0, 1, 256));

%% Define Opacity Map (Still `uint8`)
opacityMap = linspace(0, 1, 256); % Linear opacity scaling
opacityMap(1) = 0; % Ensure background is transparent

%% Create 3D Volume Rendering (Everything is `uint8`)
figure;
vol = volshow(coarseData, ...  % No type conversion
    'Alphamap', opacityMap', ...  % Adjust transparency
    'Colormap', fixedCmap, ...   % Use fixed colormap
    'Renderer', 'VolumeRendering'); % Fast GPU-based rendering

%% Customize View
view(3);
axis tight;
camlight; lighting phong;
title('3D Bone Visualization (Fully uint8, Memory Optimized)');
