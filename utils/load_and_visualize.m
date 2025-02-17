% Some useful commands for loading and visualization of the data

%     Alvar
%     Copyright (C) 2018  Ilkka Laakso
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.


%% Load data
load Alvar_v16.mat

%% Test visualization
% note: the default view direction from behind, i.e., the heart is shown on
% the left side
figure;
imagesc( squeeze(voxelData(:,250,:)) )
axis image
colormap(cmap)
caxis([0 86])

%% Downscale the model to ~1 mm 
coarseData = voxelData(1:2:end, 1:2:end, 1:2:end);
coarseVoxelSize = 2 * voxelSize;

% Visualize the coarse model
figure;
imagesc( squeeze(coarseData(:,125,:)) )
axis image
colormap(cmap)
caxis([0 86])