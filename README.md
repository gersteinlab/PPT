# Leveraging a large language model to predict protein phase transition: a physical, multiscale and interpretable approach
We apply a unified modeling framework to predict PPT. In classification task A proteins exhibiting experimental evidence of undergoing a phase transition, forming either droplets or amyloids, are consolidated into a single dataset (+Droplet drivers and +Amyloids). Phase transition propensity is predicted versus the preference to maintain the native soluble state (-PT). In classification task B the unified dataset is utilized to predict the propensity to form droplets versus amyloid aggregates. To accomplish this, we fine-tune the ESM-2 (1) model to predict PPT and compare its performance to biophysical knowledge- based models (e.g., random forest).

![Alt text](./Files/Schematic.png?raw=true "Title")
This repository provides code for predicting protein phase transition (PPT) propensity, including two examples of AD-related proteins, their associated genes, and transcription factors.

## Folder and related notebooks:
### Files folder: files needed to run the notebooks
#### 1. Code_Models: LLM.ipynb, Biophysical_classical_models.ipynb 
1. LLM.ipynb: code for fine-tuning the ESMFold model
2. Biophysical_classical_models.ipynb: code for the random forest (RF), other classical ML models and the combined model (ML_LM).
3. Attention_map_analysis.ipynb: code to analyse the attention maps extracted from the LLM.
4. Transition_Score_Heatmaps.ipynb: code for generating transition score heatmaps.

#### 2. Make_Predictions: 
1. Compute_Biophysical_Properties.ipynb: compute the biophysical features.These features serve as the input to make PPT predictions using classical machine learning models
2. Make_PPT_prediction_by_fine-tuned_ESMFold.ipynb: generate PPT predictions using the fine-tuned LLM

#### 3. Differential Gene Analysis:
1. DE_analysis.R: Differential gene expression analysis for AD vs control
2. tau_app_network.ipynb: get subnetwors of Tau and MAPT from DoRothEA database

# License
Copyright 2024 Yale University. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Cite Us
If you find this project useful, please cite us    
```bibtex
@article {Frank2023.11.21.568125,
        author = {Frank, Mor and Ni, Pengyu and Jensen, Matthew and Gerstein, Mark B},
        title = {Leveraging a large language model to predict protein phase transition: a physical, multiscale and interpretable approach},
        elocation-id = {2023.11.21.568125},
        year = {2023},
        doi = {10.1101/2023.11.21.568125},
        publisher = {Cold Spring Harbor Laboratory},
        URL = {https://www.biorxiv.org/content/early/2023/11/22/2023.11.21.568125},
        eprint = {https://www.biorxiv.org/content/early/2023/11/22/2023.11.21.568125.full.pdf},
        journal = {bioRxiv}
}
```
