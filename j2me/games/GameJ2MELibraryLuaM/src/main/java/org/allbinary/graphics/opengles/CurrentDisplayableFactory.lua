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

-- local Displayable = require("javax.microedition.lcdui.Displayable")
local J2MEUtil = require("org.allbinary.J2MEUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local AllBinaryGameCanvas = require("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local DemoCanvas = require("org.allbinary.game.displayable.canvas.DemoCanvas")
local GameInputMappingCanvas = require("org.allbinary.game.displayable.canvas.GameInputMappingCanvas")
local GameInputMappingInstructionsCanvas = require("org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas")
local GameRunnable = require("org.allbinary.game.displayable.canvas.GameRunnable")
local NullDisplayable = require("org.allbinary.game.displayable.canvas.NullDisplayable")
local NullWaitGameRunnable = require("org.allbinary.game.displayable.canvas.NullWaitGameRunnable")
local SWTUtil = require("org.allbinary.game.layer.SWTUtil")
local HighScoresCanvas = require("org.allbinary.game.score.displayable.HighScoresCanvas")
local GraphicsStrings = require("org.allbinary.graphics.GraphicsStrings")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local NullRunnable = require("org.allbinary.thread.NullRunnable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_instanceof(object, class)
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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CurrentDisplayableFactory = {}
CurrentDisplayableFactory.__index = CurrentDisplayableFactory
CurrentDisplayableFactory.className = "CurrentDisplayableFactory"

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
        return CurrentDisplayableFactory.instance
end


function CurrentDisplayableFactory.new()
    local self = setmetatable({}, CurrentDisplayableFactory)
    self:_init_fields()
        self.DEFAULT_CHILD_NAME_LIST:add(self.canvasStrings.ABOUT)
        self.DEFAULT_CHILD_NAME_LIST:add(self.canvasStrings.OPTIONS)
        self.DEFAULT_CHILD_NAME_LIST:add(GameInputMappingCanvas.NAME)
        self.DEFAULT_CHILD_NAME_LIST:add(GameInputMappingInstructionsCanvas.NAME)
        self.DEFAULT_CHILD_NAME_LIST:add(HighScoresCanvas.NAME)
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
        if self.usedRunnable ~= self.runnable then
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
            if SWTUtil.isSWT and not features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
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

CurrentDisplayableFactory.instance = CurrentDisplayableFactory.new()

return CurrentDisplayableFactory

