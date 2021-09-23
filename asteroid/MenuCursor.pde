public class MenuCursor<T extends Enum<T>> extends Actor
{
  private float h;
  private float w;
  private float distanceBetweenJump;
  private Enum SelectedOption;
  private Stack<Enum> menuUp;
  private Stack<Enum> menuDown;
  private PVector trianglePoint1 = new PVector();
  private PVector trianglePoint2 = new PVector();
  private PVector trianglePoint3 = new PVector();

  public PVector trianglePoint1(){return trianglePoint1;}
  public PVector trianglePoint2(){return trianglePoint2;}
  public PVector trianglePoint3(){return trianglePoint3;}

  public MenuCursor(Class<T> MenuType)
  {
    MenuMesures mesure = new MenuMesures();
    position = new PVector(mesure.cursorX, mesure.cursorY);
    this.h = mesure.cursorH;
    this.w = mesure.cursorW;
    this.distanceBetweenJump = mesure.cursorDistanceBetweenJump;
    //trouver commnet confirmer que c'est bien l'une ou l'autre des bon type d'enum (MenuSections ou pauseMenu)
    Object[] list = MenuType.getEnumConstants();
    menuUp = new Stack<Enum>();
    menuDown = new Stack<Enum>();
    SelectedOption =(Enum)list[0];
    for(int i=list.length - 1; i > 0; i--)
    {
      menuDown.push((Enum)list[i]);
    }
    
  }
  @Override
  public void Update(float delta)
  {
    trianglePoint1 = position.copy();
    trianglePoint2.x = position.copy().x + w;
    trianglePoint2.y = position.copy().y + h/2;
    trianglePoint3.x = position.copy().x;
    trianglePoint3.y = position.copy().y + h;
  }
  
  @Override
  public void Display()
  {
    triangle(position.x,position.y,position.x + w, position.y + (h/2), position.x, position.y+h);
  }
  
  private void SelectingCursorDown()
  {
    if(!menuDown.empty())
    {
      menuUp.push(SelectedOption);
      SelectedOption = menuDown.pop();
      position.y += distanceBetweenJump;
      println(SelectedOption);
    }
  }
  private void SelectingCursorUp()
  {
    if(!menuUp.empty())
    {
      menuDown.push(SelectedOption);
      SelectedOption = menuUp.pop();
      position.y -= distanceBetweenJump;
      println(SelectedOption);
    }  
  }
}
