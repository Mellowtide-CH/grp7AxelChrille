class Player{

	PVector position = new PVector(width/2, height/2);
	PVector acceleration = new PVector();
	PVector velocity = new PVector();
	PVector move = new PVector();
	float maxSpeed = 2000;
	float accMult = 45;
	float deaccMult = 15;
	float speed = 500;
	int size = 20;
	boolean dead = false;
	float Size = random(20, 25);
	float b;

	void draw()
	{   
	    stroke(255,224,50);
	    fill(255,50,50);

	    strokeWeight(4.5);
	    
	    line(-Size/2,0,-Size/2,Size);
	    line(Size/2,0,Size/2,Size);
	    
	    ellipse(0,0, Size, Size);
	    
	    fill(255,75,75);
	    shape(starship, 0, 0,Size*1.5,Size*1.5);
	    ellipse(0,0,Size/1.5,Size/1.5);
	    
	    pop();   
	}
	
	void update()
	{
		bounce();
		acceleration = input();
	    acceleration.mult(accMult * deltaTime);

	    if (acceleration.mag() == 0 )
	    {
	    	acceleration.x -= velocity.x * deaccMult * deltaTime;
	    	acceleration.y -= velocity.y * deaccMult * deltaTime;
	    }

	    velocity.add(acceleration);
	    velocity.limit(maxSpeed);

	    move = velocity.copy();

	   	move.mult(speed * deltaTime);

	    position.add(move);

	    push();
	    translate(position.x,position.y);
	    float a = move.heading();
    	
	    if (velocity.mag() > 0.02)
	    {
		    player.velocity.x = 0;
    		player.velocity.y = 0;
    		rotate(a + (PI/2));
	    	b = a;
		} else  {
	    	rotate(b + (PI/2));
		}


		position.x += velocity.x;
		position.y += velocity.y;

	/*	acceleration = input();
		acceleration.mult(accMult * deltaTime);

		if (acceleration.mag() == 0){
			acceleration.x -= velocity.x * deaccMult * deltaTime;
			acceleration.y -= velocity.y * deaccMult * deltaTime;
		}

		velocity.add(acceleration);

		velocity.limit(maxSpeed);

		move = velocity.copy();
		move.mult(speed * deltaTime);

		position.add(move);
		fill(0, 255, 0);
		ellipse(position.x, position.y, size, size);

		bounce();*/
	}


    void bounce()
    {
		if (position.x < (size / 2) || position.x > width - (size / 2))
			velocity.x = velocity.x * -1;
		if (position.y < (size / 2) || position.y > height - (size / 2))
			velocity.y = velocity.y * -1;
    }
}
