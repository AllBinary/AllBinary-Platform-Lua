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
-- package org.allbinary.graphics.canvas.transition.progress

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local Activity = require("android.app.Activity")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")
local PreResourceImageUtil = require("org.allbinary.image.PreResourceImageUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local ExceptionUtil = require("org.allbinary.logic.java.exception.ExceptionUtil")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local Features = require("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = require("org.allbinary.game.configuration.feature.MainFeatureFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = require("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = require("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local ImageScaleUtil = require("org.allbinary.media.image.ImageScaleUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local ImageAnimation = require("org.allbinary.animation.image.ImageAnimation")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local ARunnable = require("org.allbinary.thread.ARunnable")
local NullRunnable = require("org.allbinary.thread.NullRunnable")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidBasicTitleProgressBar = {}
AndroidBasicTitleProgressBar.__index = AndroidBasicTitleProgressBar
AndroidBasicTitleProgressBar.className = "AndroidBasicTitleProgressBar"
setmetatable(AndroidBasicTitleProgressBar, {__index = ProgressCanvas})

function AndroidBasicTitleProgressBar:_init_fields()
    self.showTitleProgressBarRunnable = NullRunnable.getInstance()
    self.dismissTitleProgressBarRunnable = NullRunnable.getInstance()
    self.titleProgressDialogPortionSetProgressRunnable = NullRunnable.getInstance()
    self.titleProgressDialogSetProgressRunnable = NullRunnable.getInstance()
    self.midletActivity = AndroidUtil.NULL_ACTIVITY
    self.portion = 0
    self.IMAGE = java_new_array(nil, 4)
    self.image = NullImage.NULL_IMAGE
    self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function AndroidBasicTitleProgressBar.new(title, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ProgressCanvas.new(title, backgroundBasicColor, foregroundBasicColor), AndroidBasicTitleProgressBar)
    self:_init_fields()
        -- super(...) made self above
        self:init()
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
        local size = (self.IMAGE.n or #self.IMAGE)
        for index = 0, size - 1 do
            self.IMAGE[index + 1] = NullImage.NULL_IMAGE
        end
    return self
end


function AndroidBasicTitleProgressBar:init()
        local try_ok, try_error = pcall(function()
            if AndroidBasicTitleProgressBar.background ~= 0 then
                ResourceUtil.getInstance():addResource(AndroidBasicTitleProgressBar.RESOURCE, AndroidBasicTitleProgressBar.background)
                GameFeatureImageCacheFactory.init()
                self.image = ImageCacheFactory.getInstance():getWithKey(AndroidBasicTitleProgressBar.RESOURCE)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end


function AndroidBasicTitleProgressBar:initActivity(activity)
        local try_ok, try_error = pcall(function()
            if self.midletActivity ~= activity then
                self.midletActivity = activity
                self.showTitleProgressBarRunnable = ShowTitleProgressBarRunnable.new(self.midletActivity, self)
                self.dismissTitleProgressBarRunnable = DismissTitleProgressBarRunnable.new(self.midletActivity, self)
                self.titleProgressDialogSetProgressRunnable = TitleProgressBarSetProgressRunnable.new(self.midletActivity, self)
                self.titleProgressDialogPortionSetProgressRunnable = TitleProgressBarPortionSetProgressRunnable.new(self.midletActivity, self)
                self:loadProgressImages()
            end
            self:updateCurrent()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end


function AndroidBasicTitleProgressBar:updateCurrent()
        local try_ok, try_error = pcall(function()
            if not self:isBackground() then
                self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
            elseif AndroidBasicTitleProgressBar.background ~= 0 then
                local displayInfo = DisplayInfoSingleton.getInstance()
                local currentImage = nil
                if displayInfo:isPortrait() then
                    currentImage = self:getImage(0)
                else
                    currentImage = self:getImage(2)
                end
                if currentImage == nil then
                    self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
                else
                    self.animation = ImageAnimation.new(currentImage, AnimationBehavior.getInstance())
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end


function AndroidBasicTitleProgressBar:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function AndroidBasicTitleProgressBar:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error = pcall(function()
            self:loadProgressImages()
            self:updateCurrent()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF(self.commonStrings.EXCEPTION_LABEL + ExceptionUtil.getInstance():getStackTrace(e), self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT)
            self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        end
end


function AndroidBasicTitleProgressBar:loadProgressImages()
        local try_ok, try_error = pcall(function()
            local displayInfo = DisplayInfoSingleton.getInstance()
            local lastWidth = displayInfo:getLastWidth()
            local lastHeight = displayInfo:getLastHeight()
            if displayInfo:isPortraitWH(lastWidth, lastHeight) then
                self:setImages(0, lastWidth, lastHeight)
            else
                self:setImages(2, lastWidth, lastHeight)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF("IllegalArgumentException " .. tostring(ExceptionUtil.getInstance():getStackTrace(e)), self, "loadProgressImages")
            self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        end
end


function AndroidBasicTitleProgressBar:isInitialized()
        if self.midletActivity ~= AndroidUtil.NULL_ACTIVITY then
            return true
        else
            return false
        end
end


function AndroidBasicTitleProgressBar:start()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START_METHOD_NAME)
            ProgressCanvas.start(self)
            self.midletActivity:runOnUiThread(self.showTitleProgressBarRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end


function AndroidBasicTitleProgressBar:end_()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
            self.midletActivity:runOnUiThread(self.dismissTitleProgressBarRunnable)
            ProgressCanvas.end_(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME, e)
        end
end


function AndroidBasicTitleProgressBar:addEarlyPortion(value, text, index)
        local try_ok, try_error = pcall(function()
            self.portion = value
            ProgressCanvas.addEarlyPortion(self, value, text, index)
            if self.midletActivity ~= AndroidUtil.NULL_ACTIVITY then
                self.midletActivity:runOnUiThread(self.titleProgressDialogPortionSetProgressRunnable)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end


function AndroidBasicTitleProgressBar:addPortion(value, text, index)
        local try_ok, try_error = pcall(function()
            self.portion = value
            ProgressCanvas.addPortion(self, value, text, index)
            self.midletActivity:runOnUiThread(self.titleProgressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end


function AndroidBasicTitleProgressBar:addNormalPortion(value, text)
        local try_ok, try_error = pcall(function()
            self.portion = value
            ProgressCanvas.addNormalPortion(self, value, text)
            self.midletActivity:runOnUiThread(self.titleProgressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end


function AndroidBasicTitleProgressBar:setValue(value)
        local try_ok, try_error = pcall(function()
            ProgressCanvas.setValue(self, value)
            self.midletActivity:runOnUiThread(self.titleProgressDialogSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setValue", e)
        end
end


function AndroidBasicTitleProgressBar:waitUntilDisplayed()
end


-- throws Exception
function AndroidBasicTitleProgressBar:setImages(index, lastWidth, lastHeight)
        local image = self.image
        if image ~= NullImage.NULL_IMAGE then
            if Features.getInstance():isFeature(MainFeatureFactory.getInstance().FULL_SCREEN) then
                if self.IMAGE[index + 1] == NullImage.NULL_IMAGE then
                    self.IMAGE[index + 1] = ImageScaleUtil.getInstance():createImage2(ImageCacheFactory.getInstance(), image, (lastWidth + 0.0), (image:getWidth() + 0.0), (lastHeight + 0.0) - 20.0, (image:getHeight() + 0.0), false)
                end
            else
                local nextIndex = index + 1
                if self.IMAGE[nextIndex + 1] == NullImage.NULL_IMAGE then
                    self.IMAGE[nextIndex + 1] = ImageScaleUtil.getInstance():createImage2(ImageCacheFactory.getInstance(), image, (lastWidth + 0.0), (image:getWidth() + 0.0), (lastHeight + 0.0) - 28.0, (image:getHeight() + 0.0), false)
                end
            end
        end
end


-- throws Exception
function AndroidBasicTitleProgressBar:initOpenGL(graphics)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.INIT)
        self.image = GameFeatureImageCacheFactory.getInstance():getWithKey(AndroidBasicTitleProgressBar.RESOURCE)
        local preResourceImageUtil = PreResourceImageUtil.getInstance()
        local size = (self.IMAGE.n or #self.IMAGE)
        for index = 0, size - 1 do
            if self.IMAGE[index + 1] ~= NullImage.NULL_IMAGE then
                self.IMAGE[index + 1] = preResourceImageUtil:encapsulate(self.IMAGE[index + 1])
            end
        end
        self:updateCurrent()
end


-- throws Exception
function AndroidBasicTitleProgressBar:update(graphics)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.UPDATE)
        self:initOpenGL(graphics)
        self.image = GameFeatureImageCacheFactory.getInstance():getWithKey(AndroidBasicTitleProgressBar.RESOURCE)
        local preResourceImageUtil = PreResourceImageUtil.getInstance()
        local size = (self.IMAGE.n or #self.IMAGE)
        for index = 0, size - 1 do
            if self.IMAGE[index + 1] ~= NullImage.NULL_IMAGE then
                preResourceImageUtil:update(graphics, self.IMAGE[index + 1])
            end
        end
end


-- throws Exception
function AndroidBasicTitleProgressBar:getImage(index)
        local image = NullImage.NULL_IMAGE
        if Features.getInstance():isFeature(MainFeatureFactory.getInstance().FULL_SCREEN) then
            image = self.IMAGE[index + 1]
        else
            image = self.IMAGE[index + 1 + 1]
        end
        return image
end


function AndroidBasicTitleProgressBar:paint2(graphics)
        local try_ok, try_error = pcall(function()
            self.animation:paintXY(graphics, 0, 20)
            ProgressCanvas.paint2(self, graphics)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.PAINT, e)
        end
end


function AndroidBasicTitleProgressBar.setBackgroundResource(background)
        AndroidBasicTitleProgressBar.background = background
end


function AndroidBasicTitleProgressBar:setBackground(background)
        ProgressCanvas.setBackground(self, background)
        self:updateCurrent()
end


function AndroidBasicTitleProgressBar:setPortion(portion)
        self.portion = portion
end


function AndroidBasicTitleProgressBar:getPortion()
        return self.portion
end

AndroidBasicTitleProgressBar.RESOURCE = "ProgressImage"
AndroidBasicTitleProgressBar.background = 0

return AndroidBasicTitleProgressBar

