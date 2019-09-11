class Population
{
  private int popsize;
  private Word [] words;
  private ArrayList<Word> matingpool;
  private HashMap<String, Integer> map;
  
  public Population(int popsize)
  {
    int i;
    this.popsize = popsize;
    this.words = new Word[popsize];
    for(i=0;i<popsize;i++)
    this.words[i] = new Word(new PVector(100*((i+1)%12)+100,500+150*(i/12)));
  }
  
  public void run()
  {
    int i;
    for(i=0;i<popsize;i++)
    {
      this.words[i].show();
    }
  }
  
   public void evaluate()
   {
     int i,j;
     float maxfitness=0,n;
     
     for(i=0;i<this.popsize;i++)
     {
       if(this.words[i].fitness > maxfitness)
       maxfitness = this.words[i].fitness;
     }
     
     for(i=0;i<this.popsize;i++)words[i].fitness /= maxfitness;
     
     this.matingpool = new ArrayList<Word>();
     
     for(i=0;i<this.popsize;i++)
     {
       n = this.words[i].fitness *100; 
       for(j=0;j<n;j++)this.matingpool.add(this.words[i]);
       
     }
   }
  
  public void selection()
  {
    int index,i,help;
    Word[] newwords = new Word[popsize];
    
    for(i=0;i<popsize;i++)
    {
      index = floor(random(0,matingpool.size()));
      DNA parentA = this.matingpool.get(index).dna;
      index = floor(random(0,matingpool.size()));
      DNA parentB = this.matingpool.get(index).dna;
      DNA child = parentA.crossover(parentB);
      child.mutation();
      newwords[i] = new Word(new PVector(100*((i+1)%12)+100,500+150*(i/12)),child);
    }
    this.map = new HashMap<String,Integer>();
    
    for(i=0;i<this.popsize;i++)this.map.put(newwords[i].dna.genes, 0);
   
    
    for(i=0;i<this.popsize;i++)
    {
      help = this.map.get(newwords[i].dna.genes);
      if(help >= 0)
      {
        help++;
        this.map.put(newwords[i].dna.genes,help);
      }
    }
    
    for(i=0;i<this.popsize;i++)
    {
      help = this.map.get(newwords[i].dna.genes);
      if(help > 1)
      {
        help--;
        this.map.put(newwords[i].dna.genes,help);
        newwords[i].dna.genes = random_word();
      }
    }
    
    this.words = newwords;
   }
  
}
