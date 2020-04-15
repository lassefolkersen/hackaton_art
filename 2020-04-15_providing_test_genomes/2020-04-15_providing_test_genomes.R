
#temporarily attach the test data volume
mkdir data2
lsblk
sudo mount /dev/xvdf data2
cat /etc/fstab #good only permanently have the biohackaton volume on
ls ~/data2 #thousand test genomes, but don't need the synthetic triplicates, too confusing, and could cause trouble when the result look too similar

R
all_samples<-list.files("data2",full.names=T)
length(all_samples) #993
w1<-grep("myh$",all_samples)
w2<-grep("anc$",all_samples)
w3<-grep("23a$",all_samples)
go_samples <- all_samples[!(1:length(all_samples)%in%c(w1,w2,w3))]
set.seed(42)
take_samples <- sample(go_samples, 50)


for(this_sample in take_samples){
  print(this_sample)
 file.copy(this_sample, "~/data",recursive=T) 
  
}