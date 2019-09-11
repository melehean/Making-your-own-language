Population pop;
int word_length, words_number, current_window;
Checkbox[] choose_length;
Checkbox[] choose_number;
Checkbox_group group_choose_number;
Checkbox_group group_choose_length;
PImage letters, column;
Button next_button, next_generation;


void setup()
{
  size(1400, 1000);
  current_window = 0;
  setup_choose_length();
  setup_choose_number();
  letters = loadImage("letters.jpg");
  column = loadImage("column.png");
  next_button = new Button(1200, 470, 120, 120, "next.png", false);
  next_generation = new Button(600,380,200,100,"New generation", true);
}

void draw()
{
  background(255);
  if(current_window == 0)zero_window();
  else if(current_window == 1)first_window();
  else if(current_window == 2)second_window();
  else if(current_window == 3)
  {
    images();
    if(pop==null)pop = new Population(words_number);
    pop.run();
    next_generation.show();
    if(next_generation.get_pressed() == true)
    {
      pop.evaluate();
      pop.selection();
      next_generation.silence();
    }
  }
}

void zero_window()
{
  images();
  show_text("Introduction","This application is some kind of random word generator, but a bit more smart ;)" ); 
  next_button.show();
  if(next_button.get_pressed() == true)
  {
    next_button.silence();
    current_window = 1;
  }
}

void first_window()
{
  images();
  show_text("Length of words", "Every word will have the same length, so choose one number from these beneath :)");
  group_choose_length.run();
  next_button.show();
  if(next_button.get_pressed() == true)
  {
    word_length = group_choose_length.get_checked()+2;
    current_window = 2;
    next_button.silence();
  }
}

void second_window()
{
  images();
  show_text("Number of words in every generation", "Choose only one number from these beneath :)");
  group_choose_number.run();
  next_button.show();
  if(next_button.get_pressed() == true)
  {
    words_number = (group_choose_number.get_checked()+1)*12;
    current_window = 3;
    next_button.silence();
  }
}

void images()
{
  image(letters, 400, 0, 600, 400);
  image(column,100,0,200,400);
  image(column,1100,0,200,400);
}

void setup_choose_length()
{
  choose_length = new Checkbox[10];
  choose_length[0] = new Checkbox("2", 100, 600);
  choose_length[1] = new Checkbox("3", 100, 650);
  choose_length[2] = new Checkbox("4", 100, 700);
  choose_length[3] = new Checkbox("5", 200, 600);
  choose_length[4] = new Checkbox("6", 200, 650);
  choose_length[5] = new Checkbox("7", 200, 700);
  group_choose_length = new Checkbox_group(6, choose_length);
} 

void setup_choose_number()
{
  choose_number = new Checkbox[3];
  choose_number[0] = new Checkbox("12", 100, 600);
  choose_number[1] = new Checkbox("24", 100, 650);
  choose_number[2] = new Checkbox("36", 100, 700);
  group_choose_number = new Checkbox_group(3,choose_number);
}

String random_word()
{
  int i;
  String help_string = new String("");
  for(i=0;i<word_length;i++)
    help_string+=(char)(random(97,123));
  return help_string;
}

void show_text(String heading, String sentence)
{
  textSize(35);
  fill(27);
  text(heading, 50,500);
  textSize(20);
  text(sentence,50, 550);
}
