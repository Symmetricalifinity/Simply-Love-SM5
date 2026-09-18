local num_items = THEME:GetMetric("MusicWheel", "NumWheelItems")
-- subtract 2 from the total number of MusicWheelItems
-- one MusicWheelItem will be offsceen above, one will be offscreen below
local num_visible_items = num_items - 2

local item_width = _screen.w / 2.125

local af =  Def.ActorFrame{
	-- the MusicWheel is centered via metrics under [ScreenSelectMusic]; offset by a slight amount to the right here
    InitCommand = function(self) self:x(WideScale(28, 33)) end,

    Def.Quad {
        InitCommand = function(self)
            self:horizalign(left):diffuse(0, 10 / 255, 17 / 255, 0.5):zoomto(item_width, _screen.h / num_visible_items)
        end
    },
    Def.Quad {
        InitCommand = function(self)
            self:horizalign(left):diffuse(DarkUI() and {1, 1, 1, 0.5} or {10 / 255, 20 / 255, 27 / 255, 1}):zoomto(item_width, (_screen.h / num_visible_items) - 1)
            if ThemePrefs.Get("VisualStyle") == "SRPG10" or ThemePrefs.Get("VisualStyle") == "Technique" then
                self:diffusealpha(0.5)
            end
        end,
		SetCommand=function(self, params)
			if params.Song then
				local song = params.Song
				local offset = round(SONGMAN:GetGroup(song):GetSyncOffset(), 3)
				if offset == -0.009 then
					self:diffuserightedge(DarkUI() and {1, 1, 1, 0.5} or {10 / 255, 20 / 255, 27 / 255, 1})
				else
					self:diffuserightedge(DarkUI() and {1, 0.5, 0.5, 0.5} or {80 / 255, 20 / 255, 27 / 255, 1})
				end
				if ThemePrefs.Get("VisualStyle") == "SRPG10" or ThemePrefs.Get("VisualStyle") == "Technique" or ThemePrefs.Get("VisualStyle") == "Transistor" then
					self:diffusealpha(0.5)
				end
			end
		end,
    }
}

if ThemePrefs.Get("SongSelectBG") ~= "Off" then
	af[#af+1] = Def.Sprite{
		InitCommand=function(self)
			self:horizalign(right):addx(item_width):scaletoclipped(item_width-50, _screen.h/num_visible_items-2):visible(true)
			self:diffusealpha(0.25):fadeleft(1):SetDecodeMovie(false)
		end,
		SetCommand=function(self, params)
			local Song = params.Song
			local Course = params.Course
			local Path = nil
			
			if Song then
				if Song:GetBackgroundPath() ~= nil then
					Path = Song:GetBackgroundPath()
				end
				if Song:GetBannerPath() ~= nil then
					if Path == nil or ThemePrefs.Get("SongSelectBG") == "Banner" then
						Path = Song:GetBannerPath()
					end
				end
					
				if Path ~= nil then
					self:Load( Path ):visible(true)
				else
					self:visible(false)
				end
			elseif Course then
				if Course:GetBackgroundPath() ~= nil then
					Path = Course:GetBackgroundPath()
				end
				if Course:GetBannerPath() ~= nil then
					if Path == nil or ThemePrefs.Get("SongSelectBG") == "Banner" then
						Path = Course:GetBannerPath()
					end
				end
					
				if Path ~= nil then
					self:Load( Path ):visible(true)
				else
					self:visible(false)
				end
			else
				self:visible(false)
			end
		end
	}
end

af[#af+1] = Def.BitmapText {
	Font=ThemePrefs.Get("ThemeFont") .. " Normal",
	InitCommand=function(self)
		self:halign(0):xy(WideScale(47, 78),0):zoom(0.85):maxwidth(WideScale(245,350)):diffuse(ThemePrefs.Get("RainbowMode") and color("#0a141b") or Color.White)
	end,
	SetCommand=function(self, params)
		if params.Song then
			self:settext(params.Song:GetDisplayMainTitle() or ""):y((params.Song:GetDisplaySubTitle() or "")~="" and -6 or 0)
			if params.Song:GetMainTitle()=="DVNO" then self:diffuse(1,0.8,0,1) end
		elseif params.Course then
			self:settext(params.Course:GetDisplayFullTitle() or ""):diffuse(params.Color):x(WideScale(32,71)):maxwidth(WideScale(270,350))
		end
	end,
}
af[#af+1] = Def.BitmapText {
	Font=ThemePrefs.Get("ThemeFont") .. " Normal",
	InitCommand=function(self)
		self:halign(0):xy(WideScale(47, 78),6):zoom(0.7):maxwidth(WideScale(245,350)):diffuse(ThemePrefs.Get("RainbowMode") and color("#0a141b") or Color.White)
	end,
	SetCommand=function(self, params)
		if params.Song then
			self:settext(params.Song:GetDisplaySubTitle() or ""):visible(self:GetText() ~= "")
			if params.Song:GetMainTitle()=="DVNO" then self:diffuse(1,0.8,0,1) end
		else
			self:visible(false)
		end
	end,
}


local players = GAMESTATE:GetHumanPlayers()

for i in ivalues(players) do
	af[#af+1] = LoadActor(THEME:GetPathG("", "MusicWheelItem RPGRate.lua"), i)
end

return af
