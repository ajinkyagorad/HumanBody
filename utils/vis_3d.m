%% Load Data
load('Alvar_v16.mat'); % Load voxel data

%% Downscale for Faster Rendering (Optional)
coarseData = voxelData(1:2:end, 1:2:end, 1:2:end); 
coarseVoxelSize = 2 * voxelSize;

%% Normalize Data for Visualization
voxelDataNorm = double(coarseData);
voxelDataNorm = voxelDataNorm / max(voxelDataNorm(:)); % Scale between 0-1

%% Fix Colormap (Expand to 256x3)
fixedCmap = interp1(linspace(0, 1, size(cmap, 1)), cmap, linspace(0, 1, 256));

%% Define Opacity Map
opacityMap = linspace(0, 1, 256); % Linear opacity scaling
opacityMap(1) = 0; % Ensure background remains transparent

%% Create Volume Rendering
figure;
vol = volshow(voxelDataNorm, ...
    'Alphamap', opacityMap', ...  % Adjust transparency
    'Colormap', fixedCmap, ...   % Use fixed colormap
    'Renderer', 'VolumeRendering'); % Fast GPU-based rendering

%% Customize View
view(3); % Set 3D view
axis tight;
camlight; lighting phong; % Improve lighting
title('3D Volume Rendering of Voxel Data');
