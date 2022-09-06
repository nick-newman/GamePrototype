// Physics
event_inherited();

// z Axis
z = 0;
heightValue = 16;
zHeight = z + heightValue;

// Movement
moveSpeed = 3;

// Acceleration
xAcceleration = 1;
yAcceleration = 1;

// Deceleration
xDeceleration = 1;
yDeceleration = 1;

// Speed Limitation
xSpeedLimit = moveSpeed;
ySpeedLimit = moveSpeed;

// Interaction
pushForce = 1;
pushResist = 1;

// Jumping
jumpSpeed = 5;
currentJump = 0;
maxJump = 4;
jumping = false;

// Immunity
immunityOn = false;
immunityTime = 0.2;

// Death
dead = false;

// Respawn
respawnTime = 1;
respawning = false;

// Health
currentHealth = 100;
maxHealth = currentHealth;
healthRegen = 1;
healthRegenCooldown = 5;

// Attacking
currentWeapon = 1;
attackRate = 0;
attacking = false;
canAttack = true;