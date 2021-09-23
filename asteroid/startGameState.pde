public enum MenuSections
{
  START_GAME,
  CONFIGURATION,
  CONTROLS,
  QUIT,
}

public class StartGameState extends States
{
  private double TimeBetweenKeyType = 60;
  private Timer canTypeKey;
  private States State;
  //private MenuStaticMesures MSM = new MenuStaticMesures();
  private MenuCursor Selector;
  
  public StartGameState(States state, InputManager inputManager)
  {
    super(inputManager);
    this.State = state;
    InitSelector();
    canTypeKey = new Timer();
  }
  
  @Override
  public void Update(float delta)
  {
    if(canTypeKey.hasFinished(delta))
    {
      if(keyMap.get(KeyMap.ARROW_UP))
      {
        manageTimeKeyPress(KeyMap.ARROW_UP);
        Selector.SelectingCursorUp();
      }
      else if(keyMap.get(KeyMap.ARROW_DOWN))
      {
        manageTimeKeyPress(KeyMap.ARROW_DOWN);
        Selector.SelectingCursorDown();
      }
      else if(keyMap.get(KeyMap.SELECT))
      {
        manageTimeKeyPress(KeyMap.SELECT);
      }
      else if(keyMap.get(KeyMap.BACK))
      {
        manageTimeKeyPress(KeyMap.BACK);
      }
    }
  }
  @Override
  public void Display()
  {
    background(175);
    MainWindow();
    Selector.Display();
  }
  
  private void MainWindow()
  {
    noStroke();
  }
  
  private void manageTimeKeyPress(KeyMap _key)
  {
    keyMap.replace(_key,false);
    //println(_key);
    canTypeKey.startT(TimeBetweenKeyType);
  }
  
  private void InitSelector()
  {
    Enum SendMenuType = MenuSections.START_GAME;
    Selector = new MenuCursor(SendMenuType.getDeclaringClass()); 
  }
  
}
