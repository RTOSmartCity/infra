# Final Project Proposal COMP4900E - CV2X Simulations

## Multiple simulations of various scenarios wherein CV2X vehicles interact with their environments

## Authors

### Caleb Aitken

- Infrastructure implementation
- Stats on user errors in vehicles/Justification

### Sean Meaney

- Car implementation

### Josh Panza

- IPC protocols and implementation
- Architect
- Documentation

### Victor Sandru

- Network implementation

### Quentin Wolkensperg

- Simulation implementation
- Pedestrian implementation

## Detailed Description

### Overview of Domain

CV2X (Cellular Vehicle-to-Everything) refers to a class of automobile that communicates with different actors in its environment through varying cellular channels. From Qualcomm's website: This allows for "real-time, highly reliable and actionable information flows to enable safety, mobility and environmental applications." (Qualcomm). Communication with these actors can be divided into 4 classifications:

- Vehicle-to-vehicle (V2V)
- Vehicle-to-infrastructure (V2I)
- Vehicle-to-network (V2N)
- Vehicle-to-pedestrian (V2P)

(Qualcomm)

### What Does this Project Intend to Solve?

This project will sovle the problem of human error on roads and remove the possibility of human error through delegating the task of navigating roads to more reliable entities. This project implements a fully realized CV2X system that will not require any driver intervention. The infrastructure created will also no longer require any physical detection from vehicles. The goal is to have a fully connected network that makes decisions in real-time based on information from multiple agents. There will be no explicit human interaction with this network apart from requests to move, such as inputting a desired destination or requesting to cross an intersection. All of this will be developed with security and efficiency in mind.

### Outline of Development Technology

- C++ langauge
- Based on QNX for RTOS implemetation
- QT will be used for the visual representation of the GUI
- IPC model?
