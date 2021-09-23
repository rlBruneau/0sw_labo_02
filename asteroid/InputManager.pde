import java.util.*;

public class InputManager
{
  private HashMap<KeyMap,Boolean> keyMap;
  public HashMap<KeyMap,Boolean>keyMap(){return keyMap;}
  public InputManager()
  {
    keyMap = new HashMap<KeyMap,Boolean>();
    InitKeyMap();
  }
  
  public void keyPressed()
  { //<>//
    if(key != CODED)
    {
      switch (key)
      {      
        case ESC:
          if( !keyMap.get(KeyMap.ESCAPE))
          {
            key = 0;
            keyMap.replace(KeyMap.ESCAPE,true);
          }
          else
            key = Character.MAX_VALUE;
          break;
        case ENTER:
          if(!keyMap.get(KeyMap.SELECT))
            keyMap.replace(KeyMap.SELECT,true);
          break;
        case 'q':
          keyMap.replace(KeyMap.TRANSLATE_LEFT,true);
          break;
        case 'e':
          keyMap.replace(KeyMap.TRANSLATE_RIGHT,true);
          break;
        case 'a':
          keyMap.replace(KeyMap.ROTATE_LEFT,true);
          break;
        case 'd':
          keyMap.replace(KeyMap.ROTATE_RIGHT,true);
          break;
        case 'w':
          keyMap.replace(KeyMap.SPEED_UP,true);
          break;
        case BACKSPACE:
          if(!keyMap.get(KeyMap.SELECT))
            keyMap.replace(KeyMap.BACK,true);
          break;
      }
    }
    else
    {
       switch (keyCode)
      {      
        case UP:
          keyMap.replace(KeyMap.ARROW_UP,true);
          break;
        case DOWN:
          if(!keyMap.get(KeyMap.SELECT))
            keyMap.replace(KeyMap.ARROW_DOWN,true);
          break;
      }
    }
    
  }
  
  public void keyReleased()
  {
    
    // pour m'assurer que peux importe ou j'appuis sur esc dans la jeux, ça ne fermera pas le programme etster key == 0 pour escape.
    if(key != CODED)
    {
      switch (key)
      {      
        case ESC:
          keyMap.replace(KeyMap.ESCAPE,false);
          break;
        case ENTER:
          keyMap.replace(KeyMap.SELECT,false);
          break;
        case 'q':
          keyMap.replace(KeyMap.TRANSLATE_LEFT,false);
          break;
        case 'e':
          keyMap.replace(KeyMap.TRANSLATE_RIGHT,false);
          break;
        case 'a':
          keyMap.replace(KeyMap.ROTATE_LEFT,false);
          break;
        case 'd':
          keyMap.replace(KeyMap.ROTATE_RIGHT,false);
          break;
        case 'w':
          keyMap.replace(KeyMap.SPEED_UP,false);
          break;
        case BACKSPACE:
          keyMap.replace(KeyMap.SPEED_UP,false);
          break;
      }
    }
    else
    {
       switch (keyCode)
      {      
        case UP:
          keyMap.replace(KeyMap.ARROW_UP,false);
          break;
        case DOWN:
          keyMap.replace(KeyMap.ARROW_DOWN,false);
          break;
          
      }
    }
  }
  
  private void InitKeyMap()
  {
    for(KeyMap _key : KeyMap.values())
    {
      keyMap.put(_key,false);
    }
  }
}
