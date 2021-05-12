'
'	"A Pong game based on the AY-3-8500"
'
mode 3:vload "data.vram"
boardWidth = 50:rem "Size of boards back of football "
gameType = 2: rem "0 tennis,1 soccer, 2 squash, 3 practice"
batSize = 2: rem "2 large, 1 small"
proc Setup()
proc NewGame()
batEvent = 0:ballEvent = 0
proc InitialiseBall()
repeat
	if event(batEvent,3) then proc UpdateBats()
	if event(ballEvent,2) then proc UpdateBall()
until xBall < 0 or xBall > 319
end
'
'		"Draw the initial layout for the game dependent on type"
'
defproc DrawFrame(t)
	local w = 1,x,i
	paper 0:cls:sprite clear:sprite true
	for x = 0 to 319 step 8
		rect from x,0 to x+5,w:rect from x,199-w to x+5,199
	next x
	if gameType < 2 then rect from 160-w/2,0 to 160-w/2+w,199
	if gameType >= 2 then rect from 0,0 to w,199
	if gameType = 1 
		for i = 0 to 1
			x = (319-w)*i
			rect from x,0 to x+w,boardWidth
			rect from x,199 to x+w,199-boardWidth
		next i
	endif
endproc
'
'		"Draw a score 0-15"
'
defproc DrawScore(x,s)
	local y = 10
	local n = -1:if s >= 10 then n = 10
	proc DrawDigit(x,y,n)
	proc DrawDigit(x+8,y,s mod 10)
endproc
'
'		"Draw a digit"
'
defproc DrawDigit(x,y,n)
	local sx = 12,sy = 10,w = 3,bits
	rect ink 0 from x,y to x+sx,y+sy*2 ink 1
	if n >= 0
		bits = patterns(n)
		if (bits and &1) then rect x,y to x+w,y+sy
		if (bits and &2) then rect x,y to x+sx,y+w
		if (bits and &4) then rect x+sx-w,y to x+sx,y+sy
		if (bits and &8) then rect x+sx-w,y+sy to x+sx,y+sy*2
		if (bits and &10) then rect x,y+sy*2 to x+sx,y+sy*2-w
		if (bits and &20) then rect x,y+sy to x+w,y+sy*2
		if (bits and &40) then rect x,y+sy-w/2 to x+sx,y+sy+w-w/2
	endif
endproc
'
'		"Set up"
'
defproc Setup()
	dim patterns(10),score(2),px(2),px2(2),py(2)
	py(1) = 70:py(2) = 200-py(1)
	patterns(0) = &3F
	patterns(1) = &0C
	patterns(2) = &76
	patterns(3) = &5E
	patterns(4) = &4D
	patterns(5) = &5B
	patterns(6) = &7B
	patterns(7) = &0E
	patterns(8) = &FF
	patterns(9) = &5F
	patterns(10) = &21
endproc
'
'	"New Game"
'
defproc NewGame()
	xBall = -1
	proc DrawFrame(gameType)
	score(1) = 0:score(2) = 0
	twoBats = (gameType = 1)
	onePlayer = (gameType = 3)
	px(1) = 10:px(2) = 320-px(1)
	if gameType >= 2 then px(1) = 240:px(2) = px(1)+10
	px2(1) = 220:px2(2) = 320-px2(1)
	sprite 1 image batSize
	if onePlayer = 0 then sprite 2 image batSize 
	if twoBats then sprite 3 image BatSize:sprite 4 image BatSize
	batHH = 16:if batSize = 1 then batHH = 8
	;line ink 242 from 0,100 to 319,100
	proc UpdateBats():proc UpdateScore()
endproc
'
'	"Update the bats"
'
defproc UpdateBats()
	local i,y
	for i = 1 to 2
	y = py(i)+joy.y(0)*5
	y = min(200-batHH,max(y,batHH))
	py(i) = y
	next i
	sprite 1 to px(1),py(1)
	if onePlayer = 0 then sprite 2 to px(2),py(2)
	if twoBats then sprite 3 to px2(1),py(1):sprite 4 to px2(2),py(2)
endproc
'
'	"Update the score"
'
defproc UpdateScore()
	proc DrawScore(130,score(1))
	if onePlayer = 0 
		local x = 171:if score(2) < 10 then x = x-8
		proc DrawScore(x,score(2))
	endif
endproc
'
'	"Initialise the Ball"
'
defproc InitialiseBall()
	xiBall = 4:yiBall = 4:yBall = random(180)+10
	if xBall < 0:xBall = 10:else:xBall = -10:xiBall = -xiBall:endif
	sprite 0 image 0 to xBall,yBall
endproc
'
'	"Update the ball"
'
defproc UpdateBall()
	local i
	xBall = xBall+xiBall:yBall = yBall+yiBall
	if yBall <= 0 or yBall >= 200 then yiBall = -yiBall
	if xBall <= 0 or xBall >= 320 then proc CheckBounce()
	sprite 0 image 0 to xBall,yBall
	if abs(px(1)-xBall) < 3 then proc BatCheck(py(1),1)
	if abs(px(2)-xBall) < 3 then proc BatCheck(py(2),-1)
	if twoBats
		if abs(px2(1)-xBall) < 3 then proc BatCheck(py(1),1)
		if abs(px2(2)-xBall) < 3 then proc BatCheck(py(2),-1)
	endif
endproc
'
'	"Check for Bounce"
'
defproc CheckBounce()
	local bounce = false
	if gameType = 1 and abs(yBall-100) > 100-boardWidth then bounce = true
	if gameType >= 2 and xBall <= 0 then bounce = true
	if bounce then xiBall = -xiBall:xBall = xBall+xiBall
endproc
'
'	"Check for hitting bat"
'
defproc BatCheck(y,d)
	if abs(y-yBall) <= batHH 
		if gameType >= 2 then d = -1
		xiBall = d * 4
		yiBall = 4 * abs(y-yBall) / batHH+1:if y > yBall then yiBall = -yiBall
	endif
endproc