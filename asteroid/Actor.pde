public abstract class Actor extends GraphicObject implements ICollidable
{
  public boolean isAlive = true;
  protected ArrayList<PVector> forces;
  protected PVector acceleration;
  protected PVector friction;
  protected PVector gravity;
  private PVector resultant;
  public int w;
  public int h;
  public float radius;
  float angleAcc;
  protected float maxSpeed;
  //direction vector
  protected PVector velocity = new PVector();
  
  //object constant
  protected float gravityAccel = 98;
  protected float frictioncoefficient;
  protected float mass;
  public Actor(float x, float y)
  {
    super(x,y);
    resultant = new PVector();
    gravity = new PVector(0,gravityAccel);
    forces = new ArrayList<PVector>(){
      {
        add(acceleration);
        add(friction);
        add(gravity);
      }
    };
  }
  public Actor()
  {
    resultant = new PVector();
    gravity = new PVector(0,gravityAccel);
    forces = new ArrayList<PVector>(){
      {
        add(acceleration);
        add(friction);
        add(gravity);
      }
    };
  }

  public void CalculateSumForces(float delta, ArrayList<PVector> forces)
  {
    resultant.mult(0);
    for(PVector f : forces)
    {
      if(f != null)
        AddForce(delta, f);
    }
    velocity.add(resultant.mult(delta));
    position.add(velocity);

  }
  private void AddForce(float delta, PVector force)
  {
     resultant.add(force.copy().mult(delta));
  }

  //**********************************************************************************
  //*************ICollidable method empty to override in child class******************
  //**********************************************************************************

  void GotCollided()
  {
    println(this + "didn't override the method GotCollided!");
  }
}