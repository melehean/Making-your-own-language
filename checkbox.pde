class Checkbox
{
  private boolean checked;
  private String label;
  private PVector position;
  private int size, size_checked, offset;
  public Checkbox(String label,int x, int y)
  {
    this.label = new String(label);
    this.position = new PVector(x,y);
    this.size = 22;
    this.size_checked = 21;
    this.offset = 20;
    this.checked = false;
  }
  public void show()
  {
    fill(125);
    ellipse(position.x, position.y, size, size);
    if(mouseX + offset > position.x  && mouseX + offset < position.x + size 
    && mouseY + offset > position.y  && mouseY + offset < position.y + size)
    {
      checked = !checked;
    }
    if(checked == true)
    {
      fill(50);
      ellipse(position.x, position.y, size_checked, size_checked);
    }
    fill(27);
    textSize(20);
    text(label, position.x+offset, position.y+offset/2);
  }
}
