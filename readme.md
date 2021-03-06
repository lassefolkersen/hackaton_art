
## Challenge Overview
The human genome consists of 3.15 billion base pairs. If printed out on paper, it would stand 130m tall. Lasse Folkersen challenges participants to explore creative ways of visualizing human genomes and to make unique art pieces influenced by the underlying DNA sequence.

Teams choosing this challenge are expected to creatively use cutting-edge methods, such as generative adversarial networks (GANs). Success is evaluated by the same metric as modern art: it has to catch the attention of the viewers!

## About the mentor
Lasse Folkersen, Lead Scientist at Skt Hans Hospital Author of "[Forstå dit DNA](https://filo.dk/products/forsta-dit-dna-en-guide)" ([Understand your DNA](https://www.worldscientific.com/worldscibooks/10.1142/11070)) Twitter: [@lassefolkersen](https://twitter.com/lassefolkersen)


## Background

Impute.me is a web-app that provides genetic analysis. It is described in more detail [in this article](https://www.biorxiv.org/content/10.1101/861831v1). At impute.me one of the analysis modules is named ["kandinskify yourself"](https://www.impute.me/kandinsky/). It has been running almost since the founding of the project in 2015 and is based on [this algorithm](http://giorasimchoni.com/2017/07/30/2017-07-30-data-paintings-the-kandinsky-package/). It's  purpose is to generate a simple artwork based on randomness - but with the checksum of the users DNA as random seed. In this way the art is unique to the user themselves and will be so even on re-running of the procecessing. It has been accessed by approximately 10k users, which is ~25% of the total user base. A typical output looks like this:

![A screenshot of the output of the current kandinskify algorithm](https://i.imgur.com/HCsMMO7.png)


Since 2019 an additional plugin have performed the same, but with written poetry based on [this algorithm](https://github.com/schollz/poetry-generator), such as this example.

> Realized dashing rose from palm tree leaf to harrowing wind,  
> hidden doors drawn by many channels, a  
> neurotic ripple begins to seize.  
An algorithm reading your genome, 2020-02-06


The technical implementation of both these is fairly simple ([script](https://github.com/lassefolkersen/impute-me/blob/master/kandinsky/server.R)) and is only based on the property of DNA-information as a random seed. This can be improved. For this reason we launched a user survey in summer 2019 posing the following four choices

1. Focus on the written poetry: explore how the AI-generated poetry can be made even more relevant and personal, based on trait and ancestry predictions
2. Generating GAN-network-based art spanning from Rococo landscapes to modern art, then training user-impressions on genetics to provide incrementally better and better personalized precision-art
3. Generating downloadable Minecraft worlds based on your personal DNA, complete with walkable double helix tunnels, gene-annotations and warp-points for travelling to your favourite gene
4. Dont spend time on this, stick to health genetics!


The results of the survey is now available and came out in favour of option 2:
![Results of survey of users of the kandinskify module](https://i.imgur.com/1fQgNpL.png)

It is therefore of interest to expand on this into a module that will be called the  _precision art_ module.




## Suggested implementation

The main criteria of success is to showcase modern image machine learning algorithms and how they can function with genetics. In other words - if it is interesting, it is appropriate. 

A little more detailed setup idea consist of three separate work packages. A work-package 1 which expands the scope of pictures generated using [GAN](https://en.wikipedia.org/wiki/Generative_adversarial_network)-approaches and a work-package 2 which trains the outputting generator based on genetic information and user-feedback such that it can generate images that are increasingly liked by people, as deducted from their DNA information. The third work package is then to setup and collect user input to train WP 1 and 2.


For work-package 1, many interesting approaches are outlined online, e.g. [this](https://github.com/robbiebarrat/art-DCGAN), [this](https://towardsdatascience.com/image-generator-drawing-cartoons-with-generative-adversarial-networks-45e814ca9b6b), [this](https://towardsdatascience.com/generative-adversarial-networks-gans-2231c5943b11), 
or [this](https://github.com/gsurma/image_generator/blob/master/ImageGeneratorDCGAN.ipynb). All have the capability to act as image-generators based on provided data sets. More are doubtlessly available. The key is to figure out how to connect the generated image with genetic data. Presumably a checksum of DNA data could suffice, such that people with a given DNA code always get a unique image.


For work-package 2, the task involves setting up (in R/Shiny) a simple interface that can collect user-input given on each image as e.g. thumps up or thumbs down. With that in hand, as well as the complete set of derived DNA-calculations from impute.me, it should be possible to train the image-selector such that it can optimize the count of thumps up scores. If this is achieved the module will become the worlds first _precision art_ module. Within the scope of work-package 2, test data running is enough, leaving room...


For work-package 3: the task is real-life implementation in impute.me including collection of user feedback and continous automated improvement of image-selection algorithms. This is obviously not possible to do within the time frame of the Hackathon, but it is a goal to have in mind - and 51 test user profiles are provided towards testing.


The sole criteria for evaluating success of this project is the same as with any art project: ability to catch interest of viewers. As such, these work-packages should only be seen as suggested guidelines. 



## Resources available

The following resources will be made available.

1. **Hardware:** SSH-based access to an AWS cloud computer of the g3s.xlarge size, 100 GB storage, 1 GPU processor with 8 GB memory, and 4 CPU processors with 30 GB memory.
1. **Standard software**: Ubuntu (18.04), with R (3.4.4) and python (2.7.17), CUDA Toolkit (10.2, for GPU usage). The instance user has super-user rights, so you can install whatever else is needed using *sudo*.
1. **Genomics data**: In the ~/data folder. Genomic data from 51 example-genomes are available in standard impute-me format: The *id_613z86871.input_data.zip* file contains all directly measured genotypes. The *simple_format* and *gen* format files contain more extensive imputed information. The json format file contains all derived genetic calculations and may be an alternative source for genetic information. The remaining files are fast-access subsets or non-important information. All are better [described here](https://github.com/lassefolkersen/impute-me/blob/master/README.md#part-1-downloads-descriptions).
1. **Art repository data**: In the ~/art folder. Large image repositories are available online, and finding the right one may be key to this project. However, two large sets are already pre-loaded on the computer: The [CelebA](http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html) data set of 200k aligned portrait images and a web-scrape from wikiart of 10k various art images, with more details can be found on how to perform similar manual web-scrapes on different genres using the script in the folder.
1. **Custom software**: In the ~/srv and ~/programs folder. Each computer has a pre-configured copy of the impute.me web-analysis server running on shiny. This is for (optional) implementation in work-package 3. The ~/srv folder contains the running code for impute.me, the ~/programs contains required support software, e.g. impute2 and shapeit. ~/imputations is an empty folder for the queing system were uploaded data will appear. You can browse the graphical interface using any internet browser. Enter your host IP adress + `:3838` which is the standard shiny port (so e.g. `http://ec2-35-164-169-143.us-west-2.compute.amazonaws.com:3838`). To work with this code, it is recommended to make a fork of [the github repository](https://github.com/lassefolkersen/impute-me) and put locally.



## Login and setup information

1. Each team get one instance each.
1. Pick a random one from this [google-doc list](https://docs.google.com/document/d/1SxpWxGaoEJ472v4Wscfy56g9CTE0BoILpr6iuWFN_58/edit?usp=sharing). You may leave a comment to say it's taken.
1. Log in using the info, e.g write `ssh ubuntu@[address]` (if in doubt how, then use free [mobaxterm](https://www.youtube.com/watch?v=Diq9-b239vo)).
1. Immediately change password using command `sudo passwd ubuntu`. Choose password only your team knows.
1. If you can't log in, pick another instance
1. If there are none left, write lasse.folkersen@regionh.dk then we start some more.
1. If you completely mess up your instance, write lasse.folkersen@regionh.dk and get a new one (-1 point for style).
