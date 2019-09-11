class Word
{
  private float fitness;
  public DNA dna;
  private PVector rect_size, rect_position, word_position;
  
  public Word(PVector rect_position)
  {
    this.dna = new DNA();
    this.fitness = 1;
    this.rect_size = new PVector(100,100);
    this.rect_position = rect_position;
    this.word_position = new PVector(rect_position.x+word_length, rect_position.y+rect_size.y/2+word_length);
  }
  
  public Word(PVector rect_position, DNA dna)
  {
    this.dna = dna;
    this.fitness = 1;
    this.rect_size = new PVector(100,100);
    this.rect_position = rect_position;
    this.word_position = new PVector(rect_position.x+word_length, rect_position.y+rect_size.y/2+word_length);
  }
  
  public void show()
  {
    fill(255);
    rect(rect_position.x,rect_position.y,rect_size.x,rect_size.y);
    textSize(20);
    fill(27);
    text(dna.genes, word_position.x, word_position.y);
    if(mouseX>rect_position.x&&mouseX<rect_position.x + rect_size.x
    &&mouseY>rect_position.y&&mouseY<rect_position.y + rect_size.y)fitness+=0.25;
    fill(27);
    text(floor(fitness), rect_position.x+rect_size.x/2-10, rect_position.y+rect_size.y+20);
  }
  
}
