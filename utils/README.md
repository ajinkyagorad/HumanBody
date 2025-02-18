# 🌟 3D Human Voxel Data Visualization 🚀

This project contains MATLAB scripts for **loading, processing, and visualizing 3D human voxel data** from **Alvar**. The dataset includes different tissues (bones, muscles, organs) and is rendered in **high-speed 3D visualization** with GPU acceleration! 💻✨
---

## 📂 **Setup & Data Source**
To get started, **download the `.mat` files** from the official repository:
🔗 **[Alvar Dataset - Aalto University](https://version.aalto.fi/gitlab/ilaakso/alvar)**  
Place the file **`Alvar_v16.mat`** in the same directory as these scripts.

---

## 🎬 **Scripts Overview**

### 1️⃣ **`load_and_visualize.m`** 🖥️
🎯 **Loads the dataset** (`Alvar_v16.mat`)  
🎯 **Applies downscaling for faster performance**  
🎯 **Uses `volshow()` for stunning 3D rendering**  
🎬 **Run:**  
```matlab
load_and_visualize;
```

---

### 2️⃣ **`bone_select_vis.m`** 🦴
🎯 **Filters & displays only bones**  
🎯 **Efficiently processes voxel data in memory chunks**  
🎯 **Uses GPU-powered `volshow()` for fast visualization**  
🎬 **Run:**  
```matlab
bone_select_vis;
```

---

### 3️⃣ **`visualize_tissue.m`** 🏥 (Custom Tissue Selection)
🎯 **View any tissue type dynamically!**  
🎯 **Supports bones, muscles, lungs, and more**  
🎬 **Run for a specific tissue name:**  
```matlab
visualize_tissue('muscle');   % Show muscles
visualize_tissue('spinal_cord');   % Show spinal cord
visualize_tissue('lung');   % Show lungs
visualize_tissue('artery');  % Show artery
```
 ![ Alver artery ](../img/artery_alvar.png)

🎬 **Run for specific indices:**  
```matlab
visualize_tissue([11, 17, 71]);   % Show bones
visualize_tissue([34]);   % Show muscles
```

---

## ⚡ **System Requirements** 🛠️
💾 **MATLAB R2021a or newer**  
📸 **Image Processing Toolbox (for `volshow()`)**  
🎮 **GPU Recommended** for ultra-fast rendering  

---

## 🔥 **Troubleshooting & Tips**
❓ **MATLAB crashes due to memory issues?**  
💡 **Use downscaled data:** Scripts already apply **1:2 downsampling**  
💡 **Limit the Z-slices:** Modify the script to **process a specific range**  

❓ **Dataset not found?**  
💡 **Download from** [Alvar GitLab](https://version.aalto.fi/gitlab/ilaakso/alvar) and ensure it's in the working directory.

---

## 📜 **License & Credits** 🏛️
This project is based on **Alvar** dataset by **Ilkka Laakso (Aalto University)**, distributed under **GNU General Public License (GPL v3)**.  
🔗 **[Read GPL License](https://www.gnu.org/licenses/gpl-3.0.html)**

---

## 📬 **Contact & Contributions** 🌎
For dataset-related questions, visit the **[Aalto Alvar GitLab](https://version.aalto.fi/gitlab/ilaakso/alvar)**.  
For MATLAB script improvements, **feel free to contribute & share feedback!** 💡💻

