clear_log()
use_percent(false)
set {
	-5,
	1.2, 'xmod',
	-15, 'ParabolaZ',
	0, 'tipsy'
}

-- for i=0, 90, 2 do
-- 	ease {i - 0.5, 0.5, inExpo, 0.4, 'ArrowPath'}
-- 	ease {i, 1, outSine, 0, 'ArrowPath'}
-- end

ease {0, 16, linear, 0.1, 'tipsy', 0.1, 'drunk', 0.1, 'drunkz'}

set {15, math.pi, 'ConfusionOffset',}
set {15.2, math.pi * 0.5, 'ConfusionOffset'}
set {15.5, math.pi * 1, 'ConfusionOffset'}
set {15.6, math.pi * 1.5, 'ConfusionOffset'}
set {15.7, 0, 'ConfusionOffset'}

ease {30, 2, inExpo, 0, 'tipsy', 0, 'drunk', 0, 'drunkz', 1, 'xmod', 0, 'drunkz', 0.1, 'tiny', 30, 'ParabolaZ'}

ease {32, .5, outExpo, 
	0.2, 'tipsy', 
	0.5, 'drunk', 
	1, 'drunkz', 
	1.25, 'xmod', 
	-0.1, 'tiny', 
	2, 'boost',
	math.pi * 2, 'ConfusionOffset',
	-100, 'ParabolaZ'
}

set {32.5, 0, 'ConfusionOffset'}

ease {32.5, 1, inOutExpo, 
	-.05, 'tipsy', 
	-.05, 'drunk', 
	0, 'drunkz', 
	0, 'tiny',
	0, 'ParabolaZ',
	0, 'boost'
}

ease {32.5, .5, inQuad, 0.5, 'xmod'}
ease {33, 2, outQuad, 1, 'xmod'}

for i = 33, 94, 2 do
	local flipper = (i % 4) < 2 and -1 or 1

	if i > 46 and i < 48 then goto continue end
	if i > 62 and i < 64 then goto continue end

	local modchartLevel = 0

	if i > 47 then modchartLevel = 1 end

	ease {
		i, 
		0.2, 
		inCubic, 
		0.2 * flipper, 'moveX',
		0.05, 'flip',
		1 * flipper, 'zigzag',
		15 * flipper, 'rotationY',
		modchartLevel >= 1 and -0.03 or 0, 'tiny',
		modchartLevel >= 1 and -0.05 or 0, 'movey'
	}

	ease {
		i + 0.2, 
		0.8, 
		outCubic, 
		0, 'moveX',
		0, 'flip',
		0, 'zigzag',
		0, 'tiny',
		0, 'movey',
		0, 'rotationY',
	}

	::continue::
end

for i, b in ipairs{46, 62} do
	ease {b, 0.3, inSine, 0.5, 'tipsy', 50, 'TipsySpeed', 0, 'drunk', -0.1, 'tiny'}
	ease {b + .3, 0.5, outSine, 0, 'tipsy'}
	
	set {b + .5, 0, 'TipsySpeed'}
end

ease {47, .25, outCubic, -10, 'rotationY'}
ease {47.25, .25, outCubic, 0, 'rotationY'}

ease {47.5, .25, outCubic, 10, 'rotationY'}
ease {47.75, .25, outCubic, 0, 'rotationY'}

ease {48, 1, outCubic, -.05, 'tipsy', -.05, 'drunk', 0, 'tiny'}


for i,b in ipairs({62, 62.1, 62.3, 62.5, 62.6, 62.7, 63, 63.2, 63.4, 63.75}) do
	set {b, (math.pi * (0.5 * i) % math.pi * 2), 'ConfusionOffset', -0.05 * i, 'tiny'}
end

ease {64, 1, outCubic, 
	-.15, 'tipsy', 
	-.2, 'drunk', 
	0, 'tiny', 
	math.pi * 2, 'ConfusionOffset'
}

set {64.5, 0, 'ConfusionOffset'}

ease {95, 0.5, outCubic, -1, 'moveZ', 0.1, 'Flip', 0.05, 'Tiny'}

ease {95.5, 0.5, inCubic, 0, 'moveZ', 0, 'Flip', 0, 'Tiny'}

ease {96, 112 - 96, linear, 25, 'bumpyoffset'}

set {96, 1, "sudden", 4, "suddenoffset"}
ease {96, 2, outQuad, -50, 'ParabolaZ', .1, 'tipsy', 0, 'drunk', -.2, "roll"}
-- parabolax to make it look like its coming from the center of the screen instead of the center of the playfield
ease {96, 2, outQuad, 15, "ParabolaX", plr = 1}
ease {96, 2, outQuad, -15, "ParabolaX", plr = 2}
ease {96, 2, outQuad, -10, 'rotationZ', plr = 1}
ease {96, 2, outQuad, 10, 'rotationZ', plr = 2}

ease {110, 2, inCubic, 
	0, 'ParabolaZ', 
	0, 'rotationz', 
	0, 'tipsy', 
	0.3, 'digital', 
	0.5, 'DigitalPeriod',
	0, "roll",
	0, "parabolax",
}
set {110 + 2, 0, "sudden", 0, "suddenoffset"}

ease {111, 1, inExpo, 5, 'Bumpy', 1, 'TanBumpy'}
ease {112, 1, outExpo, 0, 'Bumpy', 0, 'TanBumpy'}

for b=112,122 do
	-- cool effect but maybe for later (its like tAccel from dde)
	--for o=0,1,.25 do
	--	set {b + o, .2, "brake"}
	--	ease {b + o, .5, linear, 0, "brake"}
	--end
	ease {b - .25, .25, inExpo, b % 2 == 0 and -.5 or .5, 'confusionOffset'}
	ease {b, .75, outExpo, 0, 'confusionOffset'}
	if b % 4 == 3 then
		ease {b, .5, outBack, math.floor(b / 4) % 2 == 0 and -.05 or .05, 'confusion'}
		ease {b + .5, .5, outBack, 0, 'confusion'}
	end
end


set {
	122, 0.435345, 'digitaloffset', 0.9, 'digitalperiod', 1.2, 'xmod'
}

set {
	122.25, 0.876876, 'digitaloffset', 0.324, 'digitalperiod', 1.324, 'xmod'
}

set {
	122.4, 0.434, 'digitaloffset', 0.654, 'digitalperiod', 0.987, 'xmod'
}

set {
	122.5, 0.68678, 'digitaloffset', 0.12, 'digitalperiod', 0.4325, 'xmod'
}

ease {
	122.8, 0.2, inQuad,
	0, 'digitaloffset', 
	0, 'digitalperiod',
	1, 'xmod',
	0, 'digital',
	0.2, 'drunk'
}

local idx = 0
for b = 124, 126.25, 0.25 do
	idx = idx + 1
	set {b, math.pi * (idx / 2), 'ConfusionOffset', -0.01 * idx, 'tiny', 1 - (0.025 * idx), 'xmod'}
end

ease {
	126.25, 1, outQuad,
	0, 'tiny',
	0, 'ConfusionOffset',
	0.1, 'tipsy',
	0.1, 'tipsyspeed',
	0.1, 'drunk',
	1, 'xmod'
}


--set {
--	-10,
--	10, 'wave',
--	1, 'drunk',
--	1, 'tipsy',
--}


--ease {
--	30, 1, inCubic,
--	0, 'wave',
--	10, 'boost',
--	0, 'drunk',
--	0, 'tipsy',
--}

--ease {
--	32, 1, outCubic,
--	2, 'boost',
--	-45, 'rotationZ',
--}

--ease {
--	32, .5, outCubic,
--	-45, 'rotationZ',
--}

--ease {
--	32.5, .5, inCubic,
--	0, 'rotationZ',
--}

--for beat=33,61 do
--	local m = beat%2==0 and -1 or 1

--	ease {
--		beat - .25, .25, inCubic,
--		25, 'dizzy',
--		m, 'drunk',
--		30 * m, 'rotationY',
--	}

--	ease {
--		beat, .75, outCubic,
--		0, 'dizzy',
--		0, 'drunk',
--		0, 'rotationY',
--	}
--end


--for i=0,1 do
--	local ofs = i * 8
--	ease {
--		38 + ofs, .25, linear,
--		1, 'flip',
--	}

--	ease {
--		38.25 + ofs, .25, linear,
--		0, 'flip',
--	}
	
--	ease {
--		38.5 + ofs, .25, linear,
--		20, 'rotationZ',
--	}
--	ease {
--		38.75 + ofs, .25, linear,
--		0, 'rotationZ',
--	}
--end

--ease {
--	62, .5, outCirc,
--	4, 'boost',
--	3, 'brake',
--}


--ease {
--	64, .5, outExpo,
--	2, 'boost',
--	0, 'brake',
--}

--local a = 0
--local s = 0
--local r = 0
--local c = 0
--for beat=64,95 do
--	if beat % 4 == 0 then
--		a = a + 1
--	elseif beat % 4 == 1 then
--		s = s + 1	
--	elseif beat % 4 == 2 then
--		r = r + 1
--	elseif beat % 4 == 3 then
--		c = c + 1
--	end
--	ease {
--		beat, .5, outExpo,
--		a, 'alternate',
--		s, 'split',
--		r, 'reverse',
--		c, 'cross',
--	}
--end
