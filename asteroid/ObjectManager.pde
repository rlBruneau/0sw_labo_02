public class ObjectManager
{
  private States State;
  public States State()
  {
    return State;
  }
  
  public ObjectManager(InputManager inputManager)
  {
    State = new States(inputManager);
    State.StartGameState = new StartGameState(State, inputManager);
    State.GameState = new GameState(State, inputManager);
    State.PauseState = new PauseState(State, inputManager);
    State.CurrentState = State.GameState;
    State.StateType(StateEnum.START);
  }
}
