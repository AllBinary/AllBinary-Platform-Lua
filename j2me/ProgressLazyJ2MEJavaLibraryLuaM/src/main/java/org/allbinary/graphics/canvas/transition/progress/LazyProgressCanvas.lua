-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.graphics.canvas.transition.progress

local Processor = require("org.allbinary.canvas.Processor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LazyProgressCanvas = {}
LazyProgressCanvas.__index = LazyProgressCanvas
LazyProgressCanvas.className = "LazyProgressCanvas"
setmetatable(LazyProgressCanvas, {__index = ProgressCanvas})


function LazyProgressCanvas.new(title, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ProgressCanvas.new(title, backgroundBasicColor, foregroundBasicColor), LazyProgressCanvas)
        -- super(...) made self above
    return self
end


function LazyProgressCanvas:start()
        ProgressCanvas.start(self)
        self.hasPainted = false
end


function LazyProgressCanvas:end_()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
            self:endActual()
            self.paintable = self.GAUGE_PAINTABLE
            ImageCacheFactory.getInstance():runTask()
            ImageCacheFactory.getInstance():progressEnded()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME)
        end
end


function LazyProgressCanvas:inGame()
        self.inGameProcessor = Processor.getInstance()
end


function LazyProgressCanvas:endFromInitialLazyLoadingComplete()
        ProgressCanvas.endFromInitialLazyLoadingComplete(self)
        self.paintable = NullPaintable.getInstance()
end


function LazyProgressCanvas:endIfPaintedSinceStart()
        if self.paintable == self.GAUGE_PAINTABLE and self.hasPainted then
            self:endFromInitialLazyLoadingComplete()
        end
end

return LazyProgressCanvas

