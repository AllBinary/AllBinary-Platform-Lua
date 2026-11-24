--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.game.commands

local GameCommandsFactory = {}
package.loaded["org.allbinary.game.commands.GameCommandsFactory"] = GameCommandsFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local Command = require("javax.microedition.lcdui.Command")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameCommandsFactory is declared before the requires
GameCommandsFactory.__index = GameCommandsFactory
GameCommandsFactory.className = "GameCommandsFactory"
GameCommandsFactory.javaClassName = "org.allbinary.game.commands.GameCommandsFactory"

function GameCommandsFactory:_init_fields()
    self.TOGGLE_FULLSCREEN = Command.new("Toggle FullScreen", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.TOGGLE_KEYBOARD = Command.new("Keyboard", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.SET_MENU_DISPLAYABLE = Command.new("Set Menu Displayable", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.APPLICATION_UPDATE = Command.new(CommonStrings.getInstance().UPDATE, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.DISPLAY_ABOUT = Command.new(CanvasStrings.getInstance().ABOUT, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)
    self.OPEN_WEB_URL = Command.new("Open Web URL", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)
    self.CLOSE_OPTIONS = Command.new("Back", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.DISPLAY_OPTIONS = Command.new(CanvasStrings.getInstance().OPTIONS, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2)
    self.START_TRACE = Command.new("Start Trace", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.STOP_TRACE = Command.new("Stop Trace", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.DEFAULT_OPTIONS = Command.new("Default", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.SHOW_GAME_CANVAS = Command.new("Back to Game", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.CLOSE_AND_SHOW_GAME_CANVAS = Command.new("Back", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.QUIT_COMMAND = Command.new("Quit", StringUtil.getInstance().EMPTY_STRING, Command.STOP, 1)
    self.RESTART_COMMAND = Command.new("Restart", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 0)
    self.DISPLAY_SAVE_FORM = Command.new("Save To", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3)
    self.SAVE = Command.new("Save", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3)
    self.DISPLAY_LOAD_FORM = Command.new("Load", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3)
    self.LOAD_FILE = Command.new("Load File", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3)
    self.DELETE_FILE = Command.new("Delete File", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.EXIT_COMMAND = Command.new("Exit", StringUtil.getInstance().EMPTY_STRING, Command.EXIT, 2)
    self.EXIT_WITHOUT_PROGRESS_COMMAND = Command.new("Exit Without Progress", StringUtil.getInstance().EMPTY_STRING, Command.EXIT, 2)
    self.START_COMMAND = Command.new(CommonStrings.getInstance().START, StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.CONTINUE_COMMAND = Command.new("Continue", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.SELECT_COMMAND = Command.new("Select", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.FEATURE_UPDATE = Command.new("Feature Update", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
    self.BUY_COMMAND = Command.new("BUY", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)
end


function GameCommandsFactory.getInstance()
        if GameCommandsFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            GameCommandsFactory.instance_f = GameCommandsFactory.new()
        end
        return GameCommandsFactory.instance_f
end


function GameCommandsFactory._jinit(self)
    GameCommandsFactory._init_fields(self)
    return self
end

function GameCommandsFactory.new(...)
    local self = setmetatable({}, GameCommandsFactory)
    GameCommandsFactory._jinit(self, ...)
    return self
end

GameCommandsFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return GameCommandsFactory

