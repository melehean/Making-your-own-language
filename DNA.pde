class DNA
{
  public String genes;
  public DNA()
  {
    this.genes = new String(random_word());
  }
  
  public DNA(String genes)
  {
    this.genes = genes;
  }  

  public DNA crossover(DNA partner)
  {
    int i;
    String newgenes = new String("");
    int mid = floor(random(0,word_length));
    
    for(i=0;i<word_length;i++)
    {
      if(i>mid)newgenes+=this.genes.charAt(i);
      else newgenes+=partner.genes.charAt(i);
    }
    
    return new DNA(newgenes);
  }
  
  public void mutation()
  {
    int i;
    String pom = new String("");
    
    if(random(1)<0.01)this.genes = random_word();
    for(i=0;i<word_length;i++)
    {
      if(random(1) <0.1)
        pom+=(char)random(97,123);
      else pom+=this.genes.charAt(i);
    }
    
    this.genes = pom;
  }
}
