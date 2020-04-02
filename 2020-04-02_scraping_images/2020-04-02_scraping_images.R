

#2020-04-02 
#1
# found one here:
http://mmlab.ie.cuhk.edu.hk/projects/CelebA.html
#downloadable from here (google-drive)
https://drive.google.com/drive/folders/1lENOECdd-8is7RnVSGOrlCdamYJ8hyhd
#Takes forever, but seems well annotated and prepared
cd art
mkdir celebA




#2020-04-02
#2
#set up the python3 scraping script from wiki-images.
# --genre {portrait,landscape,genre-painting,abstract,religious-painting,cityscape,sketch-and-study,figurative,illustration,still-life,design,nude-painting-nu,mythological-painting,marina,animal-painting,flower-painting,self-portrait,installation,photo,allegorical-painting,history-painting,interior,literary-painting,poster,caricature,battle-painting,wildlife-painting,cloudscape,miniature,veduta,yakusha-e,calligraphy,graffiti,tessellation,capriccio,advertisement,bird-and-flower-painting,performance,bijinga,pastorale,trompe-loeil,vanitas,shan-shui,tapestry,mosaic,quadratura,panorama,architecture}]
# --style {impressionism,realism,romanticism,expressionism,post-impressionism,surrealism,art-nouveau,baroque,symbolism,abstract-expressionism,na-ve-art-primitivism,neoclassicism,cubism,rococo,northern-renaissance,pop-art,minimalism,abstract-art,art-informel,ukiyo-e,conceptual-art,color-field-painting,high-renaissance,mannerism-late-renaissance,neo-expressionism,early-renaissance,magic-realism,academicism,op-art,lyrical-abstraction,contemporary-realism,art-deco,fauvism,concretism,ink-and-wash-painting,post-minimalism,social-realism,hard-edge-painting,neo-romanticism,tachisme,pointillism,socialist-realism,neo-pop-art}]
# --num_pages NUM_PAGES
# --output_dir OUTPUT_DIR

cd art

#test 1
python3 genre_scraper.py --genre tessellation --style rococo --output_dir test --num_pages 2
#this works - gets 61 pictures

#test 2
python3 genre_scraper.py --genre landscape --style impressionism --output_dir firstrun --num_pages 200
#this works too, gets 3700

#test 3
python3 genre_scraper.py --genre landscape --style impressionism --output_dir secondrun

