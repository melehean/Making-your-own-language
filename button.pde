class Button
{
  private PVector position;
  private PVector size;
  private String label;
  private PImage picture;
  private int offset_x, offset_y;
  private int text_size = 20;
  private int covered_color;
  private boolean covered;
  private boolean pressed;
  private boolean is_label;
  private boolean hold;
  
  public Button(int x, int y, int w, int h, String word, boolean is_label)
  {
    this.position = new PVector(x,y);
    this.size = new PVector(w,h);
    this.covered = false;
    this.pressed = false;
    this.hold = false;
    if(is_label == true)
    {
      this.label = new String(word);
      this.is_label = true;
      this.offset_x = floor(word.length()*size.x/37);
      this.offset_y = floor(size.y/15);
    }
    else
    {
      this.picture = loadImage(word);
      this.is_label = false;
    }
  }
  
  public void show()
  {
    stroke(125);
    strokeWeight(4);
    cover();
    if(this.hold == true)covered_color = 150;
    fill(covered_color);
    rect(position.x,position.y, size.x,size.y);
    if(this.is_label == true)
    {
      fill(0);
      textSize(text_size);
      text(label, position.x+size.x/2-offset_x,position.y+size.y/2+offset_y);
    }
    else image(picture,position.x,position.y, size.x,size.y);
    if(covered == true && mousePressed == true)pressed = true;
  }
  
  private void cover()
  {
    if(mouseX>position.x && mouseX < position.x + size.x
    && mouseY > position.y && mouseY <position.y +size.y)
    {
      covered = true;
      covered_color = 150;
    }
    else 
    {
      covered = false;
      covered_color = 250;
    }
  }
  
  public void start_hold()
  {
    this.hold = true;
  }
  
  public void stop_on_pressed()
  {
    this.hold = false;
  }
  
  public boolean get_hold()
  {
    return this.hold;
  }
  
  public String get_label()
  {
    return this.label;
  }
  
  public void silence()
  {
    this.pressed = false;
    mousePressed = false;
  }
  
  public boolean get_pressed()
  {
    return this.pressed;
  }
  
  
}
