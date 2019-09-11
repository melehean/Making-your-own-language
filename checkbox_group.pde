class Checkbox_group
{
  private int size;
  private int checked; // index of checked element there would be only one checked element
  private Checkbox[] checkbox_array;
  private boolean[] if_checked;
  public Checkbox_group(int size,Checkbox[] array)
  {
    checked = 0;
    this.size = size;
    checkbox_array = new Checkbox[this.size];
    checkbox_array = array;
    if_checked = new boolean[this.size];
    int i;
    for(i=0;i<this.size;i++)
    {
      if(i!=checked)if_checked[i] = false;
      else if_checked[i] = true;
    }
  }
  
  public void run()
  {
    int i;
    checkbox_array[checked].checked = true;
    if_checked[checked] = true;
    for(i=0;i<this.size;i++)
    {
      if(i!=checked)checkbox_array[i].checked = false;
      checkbox_array[i].show();
      if(checkbox_array[i].checked != if_checked[i])
      {
        if(checkbox_array[i].checked == true)checked = i;
        if_checked[i] = checkbox_array[i].checked;
      }
    }
  }
  
  public int get_checked()
  {
    return checked;
  }
}
