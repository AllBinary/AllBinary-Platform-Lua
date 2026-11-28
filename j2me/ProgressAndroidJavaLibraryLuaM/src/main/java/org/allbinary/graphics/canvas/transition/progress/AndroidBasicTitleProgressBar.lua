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

local AndroidBasicTitleProgressBar = {}
package.loaded["org.allbinary.graphics.canvas.transition.progress.AndroidBasicTitleProgressBar"] = AndroidBasicTitleProgressBar

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

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local Activity = java_lazy("android.app.Activity")
local AndroidUtil = java_lazy("org.allbinary.AndroidUtil")
local GameFeatureImageCacheFactory = java_lazy("org.allbinary.image.GameFeatureImageCacheFactory")
local PreResourceImageUtil = java_lazy("org.allbinary.image.PreResourceImageUtil")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local ExceptionUtil = java_lazy("org.allbinary.logic.java.exception.ExceptionUtil")
local Animation = java_lazy("org.allbinary.animation.Animation")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local MainFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.MainFeatureFactory")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local DisplayChangeEventHandler = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventHandler")
local DisplayChangeEventListener = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEventListener")
local ImageCacheFactory = java_lazy("org.allbinary.image.ImageCacheFactory")
local ImageScaleUtil = java_lazy("org.allbinary.media.image.ImageScaleUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local ImageAnimation = java_lazy("org.allbinary.animation.image.ImageAnimation")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local ARunnable = java_lazy("org.allbinary.thread.ARunnable")
local NullRunnable = java_lazy("org.allbinary.thread.NullRunnable")
local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local DismissTitleProgressBarRunnable = java_lazy("org.allbinary.graphics.canvas.transition.progress.DismissTitleProgressBarRunnable")
local ShowTitleProgressBarRunnable = java_lazy("org.allbinary.graphics.canvas.transition.progress.ShowTitleProgressBarRunnable")
local TitleProgressBarPortionSetProgressRunnable = java_lazy("org.allbinary.graphics.canvas.transition.progress.TitleProgressBarPortionSetProgressRunnable")
local TitleProgressBarSetProgressRunnable = java_lazy("org.allbinary.graphics.canvas.transition.progress.TitleProgressBarSetProgressRunnable")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
end

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

-- class table AndroidBasicTitleProgressBar is declared before the requires
AndroidBasicTitleProgressBar.__index = AndroidBasicTitleProgressBar
AndroidBasicTitleProgressBar.className = "AndroidBasicTitleProgressBar"
AndroidBasicTitleProgressBar.javaClassName = "org.allbinary.graphics.canvas.transition.progress.AndroidBasicTitleProgressBar"
setmetatable(AndroidBasicTitleProgressBar, {__index = ProgressCanvas})
AndroidBasicTitleProgressBar.java_implements = " DisplayChangeEventListener "
AndroidBasicTitleProgressBar.java_interfaces = function() return {DisplayChangeEventListener} end

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


function AndroidBasicTitleProgressBar._jinit(self, title, backgroundBasicColor, foregroundBasicColor)
    java_super_init(ProgressCanvas, self, title, backgroundBasicColor, foregroundBasicColor)
    AndroidBasicTitleProgressBar._init_fields(self)
        -- super(...) made self above
        self:init()
        DisplayChangeEventHandler.getInstance():addListenerInterface(self)
        local size = (self.IMAGE.n or #self.IMAGE)
        for index = 0, size - 1 do
            self.IMAGE[index + 1] = NullImage.NULL_IMAGE
        end
    return self
end

function AndroidBasicTitleProgressBar.new(...)
    local self = setmetatable({}, AndroidBasicTitleProgressBar)
    AndroidBasicTitleProgressBar._jinit(self, ...)
    return self
end


function AndroidBasicTitleProgressBar:init()
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(AndroidBasicTitleProgressBar.background, 0) then
                ResourceUtil.getInstance():addResource(AndroidBasicTitleProgressBar.RESOURCE, AndroidBasicTitleProgressBar.background)
                GameFeatureImageCacheFactory.init()
                self.image = ImageCacheFactory.getInstance():getWithKey(AndroidBasicTitleProgressBar.RESOURCE)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "init", 0)


function AndroidBasicTitleProgressBar:initActivity(activity)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(self.midletActivity, activity) then
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "initActivity", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Activity")) end)


function AndroidBasicTitleProgressBar:updateCurrent()
        local try_ok, try_error, try_value = pcall(function()
            if not (self:isBackground()) then
                self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
            elseif not rawequal(AndroidBasicTitleProgressBar.background, 0) then
                local displayInfo = DisplayInfoSingleton.getInstance()
                local currentImage = nil
                if displayInfo:isPortrait() then
                    currentImage = self:getImage(0)
                else
                    currentImage = self:getImage(2)
                end
                if rawequal(currentImage, nil) then
                    self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
                else
                    self.animation = ImageAnimation.new(currentImage, AnimationBehavior.getInstance())
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.UPDATE, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "updateCurrent", 0)


function AndroidBasicTitleProgressBar:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(AndroidBasicTitleProgressBar, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function AndroidBasicTitleProgressBar:onDisplayChangeEvent(displayChangeEvent)
        local try_ok, try_error, try_value = pcall(function()
            self:loadProgressImages()
            self:updateCurrent()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION_LABEL + ExceptionUtil.getInstance():getStackTrace(e), self, self.canvasStrings.ON_DISPLAY_CHANGE_EVENT)
            self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        end
end
java_overload(AndroidBasicTitleProgressBar, "onDisplayChangeEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DisplayChangeEvent")) end)


function AndroidBasicTitleProgressBar:loadProgressImages()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(require("allbinary_java").to_string("IllegalArgumentException ") .. require("allbinary_java").to_string(ExceptionUtil.getInstance():getStackTrace(e)), self, "loadProgressImages")
            self.animation = NullAnimationFactory.getFactoryInstance():getInstance(0)
        end
end
java_overload(AndroidBasicTitleProgressBar, "loadProgressImages", 0)


function AndroidBasicTitleProgressBar:isInitialized()
        if not rawequal(self.midletActivity, AndroidUtil.NULL_ACTIVITY) then
            return true
        else
            return false
        end
end
java_overload(AndroidBasicTitleProgressBar, "isInitialized", 0)


function AndroidBasicTitleProgressBar:start()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START_METHOD_NAME)
            java_super(ProgressCanvas, "start", 0)(self)
            self.midletActivity:runOnUiThread(self.showTitleProgressBarRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "start", 0)


function AndroidBasicTitleProgressBar:end_()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.END_METHOD_NAME)
            self.midletActivity:runOnUiThread(self.dismissTitleProgressBarRunnable)
            java_super(ProgressCanvas, "end_", 0)(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.END_METHOD_NAME, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "end_", 0)


function AndroidBasicTitleProgressBar:addEarlyPortion(value, text, index)
        local try_ok, try_error, try_value = pcall(function()
            self.portion = value
            java_super(ProgressCanvas, "addEarlyPortion", 3)(self, value, text, index)
            if not rawequal(self.midletActivity, AndroidUtil.NULL_ACTIVITY) then
                self.midletActivity:runOnUiThread(self.titleProgressDialogPortionSetProgressRunnable)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "addEarlyPortion", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function AndroidBasicTitleProgressBar:addPortion(value, text, index)
        local try_ok, try_error, try_value = pcall(function()
            self.portion = value
            java_super(ProgressCanvas, "addPortion", 3)(self, value, text, index)
            self.midletActivity:runOnUiThread(self.titleProgressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "addPortion", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") and type(java_a3) == "number" end)


function AndroidBasicTitleProgressBar:addNormalPortion(value, text)
        local try_ok, try_error, try_value = pcall(function()
            self.portion = value
            java_super(ProgressCanvas, "addNormalPortion", 2)(self, value, text)
            self.midletActivity:runOnUiThread(self.titleProgressDialogPortionSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.ADD_PORTION, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "addNormalPortion", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and (java_a2 == nil or type(java_a2) == "string") end)


function AndroidBasicTitleProgressBar:setValue(value)
        local try_ok, try_error, try_value = pcall(function()
            java_super(ProgressCanvas, "setValue", 1)(self, value)
            self.midletActivity:runOnUiThread(self.titleProgressDialogSetProgressRunnable)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setValue", e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "setValue", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AndroidBasicTitleProgressBar:waitUntilDisplayed()
end
java_overload(AndroidBasicTitleProgressBar, "waitUntilDisplayed", 0)


-- throws Exception
function AndroidBasicTitleProgressBar:setImages(index, lastWidth, lastHeight)
        local image = self.image
        if not rawequal(image, NullImage.NULL_IMAGE) then
            if Features.getInstance():isFeature(MainFeatureFactory.getInstance().FULL_SCREEN) then
                if rawequal(self.IMAGE[index + 1], NullImage.NULL_IMAGE) then
                    self.IMAGE[index + 1] = ImageScaleUtil.getInstance():createImage2(ImageCacheFactory.getInstance(), image, (lastWidth + 0.0), (image:getWidth() + 0.0), (lastHeight + 0.0) - 20.0, (image:getHeight() + 0.0), false)
                end
            else
                local nextIndex = index + 1
                if rawequal(self.IMAGE[nextIndex + 1], NullImage.NULL_IMAGE) then
                    self.IMAGE[nextIndex + 1] = ImageScaleUtil.getInstance():createImage2(ImageCacheFactory.getInstance(), image, (lastWidth + 0.0), (image:getWidth() + 0.0), (lastHeight + 0.0) - 28.0, (image:getHeight() + 0.0), false)
                end
            end
        end
end
java_overload(AndroidBasicTitleProgressBar, "setImages", 3, function(java_a1, java_a2, java_a3) return true and type(java_a1) == "number" and type(java_a2) == "number" and type(java_a3) == "number" end)


-- throws Exception
function AndroidBasicTitleProgressBar:initOpenGL(graphics)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.INIT)
        self.image = GameFeatureImageCacheFactory.getInstance():getWithKey(AndroidBasicTitleProgressBar.RESOURCE)
        local preResourceImageUtil = PreResourceImageUtil.getInstance()
        local size = (self.IMAGE.n or #self.IMAGE)
        for index = 0, size - 1 do
            if not rawequal(self.IMAGE[index + 1], NullImage.NULL_IMAGE) then
                self.IMAGE[index + 1] = preResourceImageUtil:encapsulate(self.IMAGE[index + 1])
            end
        end
        self:updateCurrent()
end
java_overload(AndroidBasicTitleProgressBar, "initOpenGL", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


-- throws Exception
function AndroidBasicTitleProgressBar:update(graphics)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.UPDATE)
        self:initOpenGL(graphics)
        self.image = GameFeatureImageCacheFactory.getInstance():getWithKey(AndroidBasicTitleProgressBar.RESOURCE)
        local preResourceImageUtil = PreResourceImageUtil.getInstance()
        local size = (self.IMAGE.n or #self.IMAGE)
        for index = 0, size - 1 do
            if not rawequal(self.IMAGE[index + 1], NullImage.NULL_IMAGE) then
                preResourceImageUtil:update(graphics, self.IMAGE[index + 1])
            end
        end
end
java_overload(AndroidBasicTitleProgressBar, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


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
java_overload(AndroidBasicTitleProgressBar, "getImage", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AndroidBasicTitleProgressBar:paint2(graphics)
        local try_ok, try_error, try_value = pcall(function()
            self.animation:paintXY(graphics, 0, 20)
            java_super(ProgressCanvas, "paint2", 1)(self, graphics)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.canvasStrings.PAINT, e)
        end
end
java_overload(AndroidBasicTitleProgressBar, "paint2", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function AndroidBasicTitleProgressBar.setBackgroundResource(background)
        AndroidBasicTitleProgressBar.background = background
end


function AndroidBasicTitleProgressBar:setBackground(background)
        java_super(ProgressCanvas, "setBackground", 1)(self, background)
        self:updateCurrent()
end
java_overload(AndroidBasicTitleProgressBar, "setBackground", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function AndroidBasicTitleProgressBar:setPortion(portion)
        self.portion = portion
end
java_overload(AndroidBasicTitleProgressBar, "setPortion", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AndroidBasicTitleProgressBar:getPortion()
        return self.portion
end
java_overload(AndroidBasicTitleProgressBar, "getPortion", 0)

AndroidBasicTitleProgressBar.RESOURCE = "ProgressImage"
AndroidBasicTitleProgressBar.background = 0

return AndroidBasicTitleProgressBar

