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
-- package org.allbinary.graphics.j2me.workarea.canvas.event

-- local MutableTreeNode = require("javax.swing.tree.MutableTreeNode")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyCanvasEventSource = {}
MyCanvasEventSource.__index = MyCanvasEventSource
MyCanvasEventSource.className = "MyCanvasEventSource"

function MyCanvasEventSource:_init_fields()
    self.command = nil
    self.treeNode = nil
    self.angle = 0.0
end

function MyCanvasEventSource.new(...)
    local count = select("#", ...)
    if count == 2 then return MyCanvasEventSource._new2(...)
    elseif count == 3 then return MyCanvasEventSource._new3(...)
    end
end


function MyCanvasEventSource._new2(command, treeNode)
    local self = setmetatable({}, MyCanvasEventSource)
    self:_init_fields()
        self.command = command
        self.treeNode = treeNode
    return self
end


function MyCanvasEventSource._new3(command, angle, treeNode)
    local self = setmetatable({}, MyCanvasEventSource)
    self:_init_fields()
        self.command = command
        self.treeNode = treeNode
        self:setAngle(angle)
    return self
end


function MyCanvasEventSource:getCommand()
        return self.command
end


function MyCanvasEventSource:getTreeNode()
        return self.treeNode
end


function MyCanvasEventSource:getAngle()
        return self.angle
end


function MyCanvasEventSource:setAngle(angle)
        self.angle = angle
end

return MyCanvasEventSource

