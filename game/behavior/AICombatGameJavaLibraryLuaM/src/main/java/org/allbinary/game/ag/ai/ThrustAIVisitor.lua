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
-- package org.allbinary.game.ag.ai

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local Visitor = require("org.allbinary.logic.util.visitor.Visitor")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThrustAIVisitor = {}
ThrustAIVisitor.__index = ThrustAIVisitor
ThrustAIVisitor.className = "ThrustAIVisitor"
setmetatable(ThrustAIVisitor, {__index = Visitor})

function ThrustAIVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.TRUE = BooleanFactory.getInstance().TRUE
end


function ThrustAIVisitor.new()
    local self = setmetatable(Visitor.new(), ThrustAIVisitor)
    self:_init_fields()
    return self
end


function ThrustAIVisitor:visit(anyType)
        local try_ok, try_error = pcall(function()
            local basicAI = anyType
            basicAI:processKeyAI(Canvas.UP)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.VISIT, e)
        end
        return self.TRUE
end

return ThrustAIVisitor

