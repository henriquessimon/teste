//Cair

if ((!place_meeting(x, y + 1, obj_chao)) and isJumping == false and isDashing == false) {
	inAir = true
	forceFall = gravityF * 4
	y += forceFall;
} else {
	inAir = false
	y = y 
}

//Movimentação
if (keyboard_check(ord("D")) or keyboard_check(vk_right) and isDashing == false) {
	x += xSpeed
	viewDirection = 1
	dashDir = 1
}

if (keyboard_check(ord("A")) or keyboard_check(vk_left) and isDashing == false) {
	x -= xSpeed
	viewDirection = -1;
	dashDir = -1
}

if ((keyboard_check(ord("S")) or keyboard_check(vk_down)) and (inAir == true) and isDashing == false) {
	forceFall = forceFall * 1.5
	y += forceFall
}

if ((keyboard_check(vk_space)) and (inAir == false) and (totalJump < maxPulo) and isDashing == false) {
	isJumping = true
	totalJump = totalJump + forcaPulo
	y -= forcaPulo
} else {
	isJumping = false
	totalJump = 0
}

if(!isDashing) {
	if (keyboard_check_pressed(vk_shift) and dashCd == false) {
		if (keyboard_check(ord("A")) or keyboard_check(vk_left)) {
			isDashing = true
			dashTimer = dashTime
			dashDir = -1
		} else if (keyboard_check(ord("D")) or keyboard_check(vk_right)) {
			isDashing = true
			dashTimer = dashTime
			dashDir = 1
		} else {
			if (viewDirection == 1) {
				isDashing = true
				dashTimer = dashTime
				dashDir = 1
			} else {
				isDashing = true
				dashTimer = dashTime
				dashDir = -1
			}
		}
	}
} else {
	x += dashForce * dashDir * 1.5
	dashTimer -= 1;
	if (dashTimer == 0) {
		isDashing = false	
		dashCd = true
		alarm[0] = dashCdTimer
	}
}