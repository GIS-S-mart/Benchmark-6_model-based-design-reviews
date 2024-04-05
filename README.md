# Benchmark 6. "Model-based design reviews"

## Introduction

Today, the most common practice to coordinate content in Model-Centric Design reviews consists in sharing screenshots of models in a slide deck, which makes the understanding of models and the identification of relationships between the models difficult. Research studies try to improve design reviews by proposing new mediation technologies, but they show a lack of rigour in the validation phase. This repository proposes an open benchmark exercise for comparing digital materials supporting model-based design reviews.

- Type of research: quantitative
- Main discipline(s) it contributes to: engineering design, especially model-based systems engineering
- The fundamental goal of the study: to improve design, especially model-based design reviews 
- The type of contribution: empirical to practice
- Objects to validate: digital materials supporting model-based design reviews
- Expected results: a cartography of strengths and weaknesses of digital materials supporting model-based design reviews

## Glossary

- **Model-Base Design** *(synonyms: Model-Centric Design, Model-Based Systems Engineering, Model-Centric Systems Engineering, Model-Based Engineering, etc.)*: formalized application of modelling to support system requirements, design, analysis, verification and validation activities beginning in the conceptual design phase and continuing throughout development and later life cycle phases (INCOSE, 2007)
- **View** *(synonyms: viewpoint, perspective, cognitive view)*: result of an interpretation process that starts from the observation of an existing object or from the imagination of a planned object, which then leads to the creation of a set of models according to a stakeholder viewpoint, that is, a set of particular concerns in regards to the real or planned
object.
- **Model** *(synonym: representation, intermediate object, intermediate representation)*: a subjective partial description of an existing or planned technical object that results from an abstraction according to a particular view and is put forward as a basis for some purpose, such as calculations, communication, etc.

## Goals

The common goals that the candidate solutions pursue are:
- The solution shall enable design review participants to share a common understanding of intermediate representations.
- The solution shall enable design review participants to trace intermediate representations vertically, from one systemic level to another (top-down and bottom-up).
- The solution shall enable design review participants to trace intermediate representations vertically, that is, throughout the product development phases and, more generally, throughout the system life cycle phases.

## Solutions

The candidate solutions are:

1. [Screenshots of SysML diagrams in a PowerPoint presentation](datasets/Telescope/Slides/Telescope_expe.pptx)
1. [Graph-Based Virtual Reality Environment](https://rpinquie.github.io/projects/vr_mbse_review/index.html)

## Metrics

The benchmarking of the candidate solutions relies on the following measures of performance:

- **Criteria 1 (C1) is a score that measures the level of understanding of the multi-view model-based design.**

Understanding of the multi-view model-based design with access to the design review environment:
1.	What is the ID of the requirements satisfied by the assembly (from the CAD model) “TelescopeAssembly”?
2.	What is the name of the functions needed by the stakeholder “PowerGrid”?
3.	What is the name of the stakeholder which needs the requirement “Req Manual-ly pilot inclination position” to be met?
To avoid answering all the questions in a row, they are displayed one by one. 

Understanding of the multi-view model-based design without access to the design review environment:
1.	What are the stakeholders of the telescope?
2.	What are the sub-logical blocks (of the behaviour model) of the telescope?
3.	What are the stakeholders of the sub-system “MechanicalSubSystem” (in the architecture model)? 

- **Criteria 2 (C2) is the time spent by participants to answer the 6 questions**
- **Criteria 3 (C3) is the level of confidence of the participants in their answers**
- **Criteria 4 (C4) is the SUS score of usability of the multi-view model-based design environment**
- **Criteria 5 (C5) is the NASA/TLX score measuring the cognitive load of the activity** 

## Benchmark exercises

The datasets used to benchmark the candidate solutions are:

- [GO‑TO Celestron Nexstar telescope](https://github.com/GIS-S-mart/Benchmark-6_model-based-design-reviews/tree/main/datasets/Telescope)

## Benchmarking

The comparison of candidate solutions evaluated on the [GO‑TO Celestron Nexstar telescope](https://github.com/GIS-S-mart/Benchmark-6_model-based-design-reviews/tree/main/datasets/Telescope) benchmark exercise based on the metrics defined above is shown below.  

|      | [Screenshots of SysML diagrams in a PowerPoint presentation](datasets/Telescope/Slides/Telescope_expe.pptx) [Romero, 2022] | [Graph-Based Virtual Reality Environment](https://gricad-gitlab.univ-grenoble-alpes.fr/vision-r-public/vrgraphvisualization) [Romero, 2022] |
| ---- | :----------------------------------------------------------: | :----------------------------------------------------------: |
| C1   |                             13,1                             |                              12                              |
| C2   |                             11,4                             |                             15,4                             |
| C3   |                             27,6                             |                             25,9                             |
| C4   |                             66,4                             |                             74,2                             |
| C5   |                             50,4                             |                             42,9                             |

## Meta-Analysis



## References
Romero, V (2020) [Un environnement virtuel immersif, interactif et collaboratif pour les revues de conception basées sur les modèles. PhD Thesis, University Grenoble Alpes.](https://theses.hal.science/tel-04048678)
