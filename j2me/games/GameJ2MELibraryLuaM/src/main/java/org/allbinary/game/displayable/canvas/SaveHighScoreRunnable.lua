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
-- package org.allbinary.game.displayable.canvas

local SaveHighScoreRunnable = {}
package.loaded["org.allbinary.game.displayable.canvas.SaveHighScoreRunnable"] = SaveHighScoreRunnable

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

local HighScoreTextBox = java_lazy("org.allbinary.game.score.displayable.HighScoreTextBox")
local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Runnable = require("java.lang.Runnable")

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

-- class table SaveHighScoreRunnable is declared before the requires
SaveHighScoreRunnable.__index = SaveHighScoreRunnable
SaveHighScoreRunnable.className = "SaveHighScoreRunnable"
SaveHighScoreRunnable.javaClassName = "org.allbinary.game.displayable.canvas.SaveHighScoreRunnable"
SaveHighScoreRunnable.java_implements = " Runnable "
SaveHighScoreRunnable.java_interfaces = function() return {Runnable} end

function SaveHighScoreRunnable:_init_fields()
    self.progressCanvas = ProgressCanvasFactory.getInstance()
    if self.isLast == nil then self.isLast = false end
    if self.textBox == nil then self.textBox = nil end
end


function SaveHighScoreRunnable._jinit(self, isLast, textBox)
    SaveHighScoreRunnable._init_fields(self)
        self.isLast = isLast
        self.textBox = textBox
    return self
end

function SaveHighScoreRunnable.new(...)
    local self = setmetatable({}, SaveHighScoreRunnable)
    SaveHighScoreRunnable._jinit(self, ...)
    return self
end


function SaveHighScoreRunnable:run()
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            if self.isLast then
                self.textBox:submit()
            else
                self.textBox:saveHighScore()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, "run", e)
            self.progressCanvas:end_()
        end
end

return SaveHighScoreRunnable

