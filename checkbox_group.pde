class Checkbox_group
{
  private int size;
  private int checked; // index of checked element there would be only one checked element
  private Checkbox[] checkbox_array;
  private boolean[] if_checked;
  public Checkbox_group(Checkbox[] array)
  {
    checked = 0;
    this.size = array.length;
    checkbox_array = array;
    if_checked = new boolean[this.size];
    if_checked[checked] = true;
  }

  public void run()
  {
    checkbox_array[checked].checked = true;
    if_checked[checked] = true;
    for(int i=0;i<this.size;i++)
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