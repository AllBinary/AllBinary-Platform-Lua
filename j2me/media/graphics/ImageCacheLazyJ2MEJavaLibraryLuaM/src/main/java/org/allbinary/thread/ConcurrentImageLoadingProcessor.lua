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
-- package org.allbinary.thread

local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BaseImageLoadingProcessor = require("org.allbinary.thread.BaseImageLoadingProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ConcurrentImageLoadingProcessor = {}
ConcurrentImageLoadingProcessor.__index = ConcurrentImageLoadingProcessor
ConcurrentImageLoadingProcessor.className = "ConcurrentImageLoadingProcessor"
setmetatable(ConcurrentImageLoadingProcessor, {__index = BaseImageLoadingProcessor})
local ImageCacheRunnable = {}
    ImageCacheRunnable.__index = ImageCacheRunnable
    ImageCacheRunnable.className = "ImageCacheRunnable"
    setmetatable(ImageCacheRunnable, {__index = ABRunnable})
    ConcurrentImageLoadingProcessor.ImageCacheRunnable = ImageCacheRunnable

    function ImageCacheRunnable:_init_fields()
        self.imageCache = nil
    end
    

    function ConcurrentImageLoadingProcessor.new(imageCache)
        local self = setmetatable(ABRunnable.new(), ConcurrentImageLoadingProcessor)
        self:_init_fields()
            self.imageCache = imageCache
        return self
    end
    

    function ConcurrentImageLoadingProcessor:run()
            local logUtil = LogUtil.getInstance()
            local try_ok, try_error = pcall(function()
                self:setRunning(true)
                self.imageCache:waitForLoadNow()
                self.imageCache:loadImages()
                self.imageCache:loadRemainingAnimations()
                self:setRunning(false)
                local progressCanvas = ProgressCanvasFactory.getInstance()
                if not progressCanvas.inProgress then
                    progressCanvas:endFromInitialLazyLoadingComplete()
                end
            end)
            if not try_ok then
                local e = try_error
                self:setRunning(false)
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, commonStrings.RUN, e)
            end
    end


function ConcurrentImageLoadingProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.runnable = nil
end


function ConcurrentImageLoadingProcessor.new(imageCache)
    local self = setmetatable(BaseImageLoadingProcessor.new(), ConcurrentImageLoadingProcessor)
    self:_init_fields()
        self.runnable = ImageCacheRunnable.new(imageCache)
    return self
end


function ConcurrentImageLoadingProcessor:runTask()
        if not self.runnable:isRunning() then
            ImageThreadPool.getInstance():runTask(self.runnable)
        end
end

return ConcurrentImageLoadingProcessor

