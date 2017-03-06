counter=1
c=1.0
for a in 1.0 0.8 0.6 0.4 0.2 0.1
do
   b=$(echo "$c/$a" | bc -l)
   docker run -v $PWD:/workspace  -i -t --rm dansand/underworld2-dev mpirun -np 16 python isotropic.py A $counter md.res=96 dp.eta1*=$a dp.eta2*=$a dp.U0*=$b
   #docker run -v $PWD:/workspace  -i -t --rm dansand/underworld2-dev mpirun -np 16 python isotropic.py B $counter md.res=96 dp.eta1*=$a dp.eta2*=1. dp.U0*=$b
   #docker run -v $PWD:/workspace  -i -t --rm dansand/underworld2-dev mpirun -np 16 python isotropic.py C $counter md.res=96 dp.eta1*=1.0 dp.eta2*=$a dp.U0*=1.0
   #echo $a $b
   let counter=counter+1
done
