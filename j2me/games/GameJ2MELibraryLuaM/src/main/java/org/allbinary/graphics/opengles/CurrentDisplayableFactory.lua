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
-- package org.allbinary.graphics.opengles

local CurrentDisplayableFactory = {}
package.loaded["org.allbinary.graphics.opengles.CurrentDisplayableFactory"] = CurrentDisplayableFactory

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

local Displayable = java_lazy("javax.microedition.lcdui.Displayable")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local DemoCanvas = java_lazy("org.allbinary.game.displayable.canvas.DemoCanvas")
local GameInputMappingCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingCanvas")
local GameInputMappingInstructionsCanvas = java_lazy("org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas")
local GameRunnable = java_lazy("org.allbinary.game.displayable.canvas.GameRunnable")
local NullDisplayable = java_lazy("org.allbinary.game.displayable.canvas.NullDisplayable")
local NullWaitGameRunnable = java_lazy("org.allbinary.game.displayable.canvas.NullWaitGameRunnable")
local SWTUtil = java_lazy("org.allbinary.game.layer.SWTUtil")
local HighScoresCanvas = java_lazy("org.allbinary.game.score.displayable.HighScoresCanvas")
local GraphicsStrings = java_lazy("org.allbinary.graphics.GraphicsStrings")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NullRunnable = java_lazy("org.allbinary.thread.NullRunnable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

-- class table CurrentDisplayableFactory is declared before the requires
CurrentDisplayableFactory.__index = CurrentDisplayableFactory
CurrentDisplayableFactory.className = "CurrentDisplayableFactory"
CurrentDisplayableFactory.javaClassName = "org.allbinary.graphics.opengles.CurrentDisplayableFactory"

function CurrentDisplayableFactory:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.canvasStrings = CanvasStrings.getInstance()
    self.stringUtil = StringUtil.getInstance()
    self.SET_DISPLAYABLE = "setDisplayable"
    self.SET_RUNNABLE = "setRunnable"
    self.CLEAR_RUNNABLE = "clearRunnable"
    self.SET_USED_RUNNABLE = "setUsedRunnable"
    self.RUNNABLE = "Runnable: "
    self.RUNNABLE_WAS_ALREADY_IN_USE = "Runnable was already in use: "
    self.DEFAULT_CHILD_NAME_LIST = BasicArrayListD.new()
    self.displayable = NullDisplayable.getInstance()
    self.openGlReadydisplayable = NullDisplayable.getInstance()
    self.runnable = NullWaitGameRunnable.getInstance()
    self.usedRunnable = NullWaitGameRunnable.getInstance()
end


function CurrentDisplayableFactory.getInstance()
        return CurrentDisplayableFactory.instance_f
end


function CurrentDisplayableFactory._jinit(self)
    CurrentDisplayableFactory._init_fields(self)
        self.DEFAULT_CHILD_NAME_LIST:add(self.canvasStrings.ABOUT)
        self.DEFAULT_CHILD_NAME_LIST:add(self.canvasStrings.OPTIONS)
        self.DEFAULT_CHILD_NAME_LIST:add(GameInputMappingCanvas.NAME)
        self.DEFAULT_CHILD_NAME_LIST:add(GameInputMappingInstructionsCanvas.NAME)
        self.DEFAULT_CHILD_NAME_LIST:add(HighScoresCanvas.NAME)
    return self
end

function CurrentDisplayableFactory.new(...)
    local self = setmetatable({}, CurrentDisplayableFactory)
    CurrentDisplayableFactory._jinit(self, ...)
    return self
end


function CurrentDisplayableFactory:setMyCanvas(displayable)
        if java_instanceof(self.displayable, MyCanvas) then
            if displayable:hasChild(self.displayable) then
                PreLogUtil.put(tostring(StringMaker.new():append("Child Displayable is already set for: "):append(self.stringUtil:toString(displayable))), self, self.SET_DISPLAYABLE)
                return
            end
        end
        self:setDisplayable(displayable)
end


function CurrentDisplayableFactory:setDisplayable(displayable)
        self.displayable = displayable
        self:setOpenGlReadydisplayable(displayable)
end


function CurrentDisplayableFactory:setOpenGlReadydisplayable(openGlReadydisplayable)
        self.openGlReadydisplayable = openGlReadydisplayable
        self:update()
end


function CurrentDisplayableFactory:getOpenGlReadydisplayable()
        return self.openGlReadydisplayable
end


function CurrentDisplayableFactory:setRunnable(runnable)
        PreLogUtil.put(tostring(StringMaker.new():append(self.RUNNABLE):append(self.stringUtil:toString(runnable))), self, self.SET_RUNNABLE)
        self.runnable = runnable
        if not rawequal(self.usedRunnable, self.runnable) then
            self:update()
        else
            PreLogUtil.put(tostring(StringMaker.new():append(self.RUNNABLE_WAS_ALREADY_IN_USE):append(self.stringUtil:toString(runnable))), self, self.SET_RUNNABLE)
        end
end


function CurrentDisplayableFactory:clearRunnable()
        PreLogUtil.put(tostring(StringMaker.new():append(self.RUNNABLE):append(self.stringUtil:toString(NullRunnable.getInstance()))), self, self.CLEAR_RUNNABLE)
        self:setUsedRunnable(NullWaitGameRunnable.getInstance())
end


function CurrentDisplayableFactory:update()
        do -- synchronized (self)
            local commonSeps = CommonSeps.getInstance()
            local features = Features.getInstance()
            local stringMaker = StringMaker.new()
            stringMaker:append(self.stringUtil:toString(self.openGlReadydisplayable))
            if SWTUtil.isSWT and not (features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) then
                PreLogUtil.put(tostring(stringMaker:append(commonSeps.SPACE):append(SWTUtil.SWT):append(commonSeps.SPACE):append(self.RUNNABLE):append(self.stringUtil:toString(NullRunnable.getInstance()))), self, self.commonStrings.UPDATE)
                self:setUsedRunnable(NullWaitGameRunnable.getInstance())
            elseif J2MEUtil.isHTML() then
                PreLogUtil.put(tostring(stringMaker:append(commonSeps.SPACE):append(GraphicsStrings.getInstance().HTML):append(commonSeps.SPACE):append(self.RUNNABLE):append(self.stringUtil:toString(self.runnable))), self, self.commonStrings.UPDATE)
                self:setUsedRunnable(self.runnable)
            elseif java_instanceof(self.openGlReadydisplayable, DemoCanvas) or java_instanceof(self.openGlReadydisplayable, AllBinaryGameCanvas) or features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
                PreLogUtil.put(tostring(stringMaker:append(commonSeps.SPACE):append(tostring(OpenGLFeatureFactory.getInstance().OPENGL)):append(commonSeps.SPACE):append(self.RUNNABLE):append(self.stringUtil:toString(self.runnable))), self, self.commonStrings.UPDATE)
                self:setUsedRunnable(self.runnable)
            else
                PreLogUtil.put(tostring(stringMaker:append(self.RUNNABLE):append(self.stringUtil:toString(NullRunnable.getInstance()))), self, self.commonStrings.UPDATE)
                self:setUsedRunnable(NullWaitGameRunnable.getInstance())
            end
        end
end


function CurrentDisplayableFactory:getDisplayable()
        return self.displayable
end


function CurrentDisplayableFactory:getUsedRunnable()
        return self.usedRunnable
end


function CurrentDisplayableFactory:setUsedRunnable(usedRunnable)
        PreLogUtil.put(tostring(StringMaker.new():append(self.RUNNABLE):append(self.stringUtil:toString(self.runnable)):append(CommonSeps.getInstance().COLON_SEP):append(self.stringUtil:toString(usedRunnable))), self, self.SET_USED_RUNNABLE)
        self.usedRunnable = usedRunnable
end

CurrentDisplayableFactory.instance_f = CurrentDisplayableFactory.new()

return CurrentDisplayableFactory

