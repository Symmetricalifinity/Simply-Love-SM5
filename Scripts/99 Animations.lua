-- -----------------------------------------------------------------------
-- Judgment animations (tap only)

JudgmentAnimationsTable = { -- t,j,z,a = target,judgment,zoom,alpha
	{
		name = "Default", -- this should match the custom JudgmentTween() from SL for 3.95
		animation = function(t,j,z) t:zoom(z*16/15):decelerate(0.1):zoom(z):sleep(0.6):accelerate(0.2):zoom(0) end
	},
	{
		name = "Still", -- this should match the behaviour of Etterna
		animation = function(t,j,z) t:zoom(z):sleep(0.9):linear(0):zoom(0) end
	},
	{
		name = "ITG", -- this should match the behaviour of ITG2/ITG3
		animation = function(t,j,z) t:zoom(z*4/3):decelerate(0.2):zoom(z):sleep(0.6):accelerate(0.2):zoom(0) end
	},
	{
		name = "Hold",
		animation = function(t,j,z) t:zoom(z*0.8):linear(0.3):zoom(z):sleep(0.5):linear(0):zoom(0) end
	},
	{
		name = "Fade",
		animation = function(t,j,z,a) t:zoom(z):diffusealpha(0):linear(0.1):diffusealpha(a):sleep(0.6):linear(0.2):diffusealpha(0):linear(0):zoom(0):diffusealpha(a) end
	},
	{
		name = "Glow",
		animation = function(t,j,z)
			t:glowshift():effectperiod(0.6)
			if j == "W0" then -- W0 will always be used for Fantastic when the FA+ window is disabled
				t:effectcolor1(color("#21cce800")):effectcolor2(color("#21cce8"))
			elseif j == "W1" then
				t:effectcolor1(color("#ffffff00")):effectcolor2(color("#ffffff"))
			elseif j == "W2" then
				t:effectcolor1(color("#e29c1800")):effectcolor2(color("#e29c18"))
			elseif j == "W3" then
				t:effectcolor1(color("#66c95500")):effectcolor2(color("#66c955"))
			elseif j == "W4" then
				t:effectcolor1(color("#b45cff00")):effectcolor2(color("#b45cff"))
			elseif j == "W5" then
				t:effectcolor1(color("#c9855e00")):effectcolor2(color("#c9855e"))
			elseif j == "Miss" then
				t:effectcolor1(color("#ff303000")):effectcolor2(color("#ff3030"))
			end
			t:zoom(z*16/15):decelerate(0.1):zoom(z):sleep(0.6):accelerate(0.2):zoom(0)
		end
	}
}

GetJudgmentAnimations = {}
JudgmentAnimations = {}
for i,j in ipairs(JudgmentAnimationsTable) do
	GetJudgmentAnimations[#GetJudgmentAnimations+1]=j.name
	JudgmentAnimations[j.name]=j.animation
end

-- -----------------------------------------------------------------------
-- Combo animations

ComboAnimationsTable = { -- t,z = target,zoom
	{
		name = "Still",
		animation = function(t) end
	},
	{
		name = "Grow",
		animation = function(t,z) t:zoom(z*1.1):decelerate(0.1):zoom(z) end
	},
	{
		name = "Shrink",
		animation = function(t,z) t:zoom(z/1.125):decelerate(0.1):zoom(z) end
	},
	{
		name = "Pulse",
		animation = function(t,z) t:decelerate(0.06):zoom(z*1.1):accelerate(0.06):zoom(z) end
	},
	{
		name = "Left",
		animation = function(t) t:addx(-6):decelerate(0.1):addx(6) end
	},
	{
		name = "Down",
		animation = function(t)t:addy(6):decelerate(0.1):addy(-6) end
	},
	{
		name = "Up",
		animation = function(t) t:addy(-6):decelerate(0.1):addy(6) end
	},
	{
		name = "Right",
		animation = function(t) t:addx(6):decelerate(0.1):addx(-6) end
	},
	{
		name = "Hop",
		animation = function(t) t:decelerate(0.06):addy(-6):accelerate(0.06):addy(6) end
	},
	{
		name = "Fade",
		animation = function(t) t:diffusealpha(0):linear(0.1):diffusealpha(1) end
	},
}

GetComboAnimations = {}
ComboAnimations = {}
for i,j in ipairs(ComboAnimationsTable) do
	GetComboAnimations[#GetComboAnimations+1]=j.name
	ComboAnimations[j.name]=j.animation
end