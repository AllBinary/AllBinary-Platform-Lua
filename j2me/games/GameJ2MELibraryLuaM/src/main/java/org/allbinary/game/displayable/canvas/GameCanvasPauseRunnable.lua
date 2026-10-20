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

local AndroidUtil = require("org.allbinary.AndroidUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GameRunnable = require("org.allbinary.game.displayable.canvas.GameRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameCanvasPauseRunnable = {}
GameCanvasPauseRunnable.__index = GameCanvasPauseRunnable
GameCanvasPauseRunnable.className = "GameCanvasPauseRunnable"
setmetatable(GameCanvasPauseRunnable, {__index = GameRunnable})

function GameCanvasPauseRunnable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.allBinaryGameCanvas = nil
end


function GameCanvasPauseRunnable.new(allBinaryGameCanvas)
    local self = setmetatable(GameRunnable.new(), GameCanvasPauseRunnable)
    self:_init_fields()
        self.allBinaryGameCanvas = allBinaryGameCanvas
    return self
end


function GameCanvasPauseRunnable:run()
end


-- throws Exception
function GameCanvasPauseRunnable:processLoopSleep()
        local try_ok, try_error = pcall(function()
            local features = Features.getInstance()
            local isOpenGL = features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL)
            if isOpenGL then
                self.allBinaryGameCanvas:processSleep()
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
        end
end

return GameCanvasPauseRunnable

