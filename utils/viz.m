function bone_visualization_gui
    % Load Data
    data = load('../Alvar_v16.mat'); 
    
    if ~isfield(data, 'tissueNames') || ~isfield(data, 'voxelData')
        error('Loaded data does not contain expected fields: tissueNames and voxelData.');
    end
    
    tissueNames = data.tissueNames; 
    voxelData = uint8(data.voxelData); % Ensure uint8 type
    cmap = data.cmap; % Ensure colormap is available

    % Create UI Figure for Checkboxes
    uiFig = uifigure('Name', 'Tissue Selection', 'Position', [100, 100, 300, 500]);

    % Create Checkboxes Table
    numTissues = numel(tissueNames);
    checkboxData = cell(numTissues, 2);
    checkboxData(:, 1) = {false}; % Initially all unchecked
    checkboxData(:, 2) = tissueNames;

    uit = uitable(uiFig, 'Data', checkboxData, 'ColumnEditable', [true, false], ...
                  'ColumnName', {'Select', 'Tissue'}, 'Position', [10, 50, 280, 400], ...
                  'CellEditCallback', @update_display);

    % Create Update Button
    uibutton(uiFig, 'Text', 'Update', 'Position', [100, 10, 100, 30], ...
             'ButtonPushedFcn', @update_display);

    % Create Volume Rendering Figure
    volFig = figure('Name', 'Bone Visualization', 'NumberTitle', 'off', ...
                    'Position', [450, 100, 600, 600]);

    % Initial Render
    render_volume([]);

    % Update Display
    function update_display(~, event)
        selectedIndices = find_selected();
        render_volume(selectedIndices);
    end

    % Find Selected Tissues
    function indices = find_selected()
        selected = find(cell2mat(uit.Data(:, 1))); % Find selected rows
        indices = uint8(selected); % Convert to uint8 for voxel matching
    end

    % Render Volume
    function render_volume(indices)
        fprintf('Processing voxel data...\n');

        if isempty(indices)
            filteredVoxelData = zeros(size(voxelData), 'uint8'); % Show empty if no selection
        else
            filteredVoxelData = voxelData;
            mask = ~ismember(voxelData, indices);
            filteredVoxelData(mask) = 0; % Set non-selected voxels to 0
        end

        % Ensure colormap compatibility
        fixedCmap = interp1(linspace(0, 1, size(cmap, 1)), cmap, linspace(0, 1, 256));
        opacityMap = linspace(0, 1, 256);
        opacityMap(1) = 0; % Transparent background

        % 3D Volume Rendering
        figure(volFig);
        clf(volFig);
        volshow(filteredVoxelData, 'Alphamap', opacityMap', 'Colormap', fixedCmap, ...
                'RenderingStyle', 'VolumeRendering');
        fprintf('Rendering complete!\n');
    end
end
