-- -----------------------------------------------------------------------
-- Judgment animations (tap only)

JudgmentAnimationsTable = { -- t,z,j = target,zoom,judgment
	{
		name = "Default", -- this should match the custom JudgmentTween() from SL for 3.95
		animation = function(t,z,j) t:zoom(z*16/15):decelerate(0.1):zoom(z):sleep(0.6):accelerate(0.2):zoom(0) end
	},
	{
		name = "Still", -- this should match the behaviour of Etterna
		animation = function(t,z,j) t:zoom(z):sleep(0.9):linear(0):zoom(0) end
	},
	{
		name = "ITG", -- this should match the behaviour of ITG2/ITG3
		animation = function(t,z,j) t:zoom(z*4/3):decelerate(0.2):zoom(z):sleep(0.6):accelerate(0.2):zoom(0) end
	},
	{
		name = "Hold", -- this should match the custom JudgmentTween() from SL for 3.95
		animation = function(t,z,j) t:zoom(z*0.8):linear(0.3):zoom(z):sleep(0.5):linear(0):zoom(0) end
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
		animation = function(t,z) end
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
		animation = function(t,z) t:addx(-6):decelerate(0.1):addx(6) end
	},
	{
		name = "Down",
		animation = function(t,z)t:addy(6):decelerate(0.1):addy(-6) end
	},
	{
		name = "Up",
		animation = function(t,z) t:addy(-6):decelerate(0.1):addy(6) end
	},
	{
		name = "Right",
		animation = function(t,z) t:addx(6):decelerate(0.1):addx(-6) end
	},
	{
		name = "Hop",
		animation = function(t,z) t:decelerate(0.06):addy(-6):accelerate(0.06):addy(6) end
	},
	{
		name = "Fade",
		animation = function(t,z) t:diffusealpha(0):linear(0.1):diffusealpha(1) end
	},
}

GetComboAnimations = {}
ComboAnimations = {}
for i,j in ipairs(ComboAnimationsTable) do
	GetComboAnimations[#GetComboAnimations+1]=j.name
	ComboAnimations[j.name]=j.animation
end