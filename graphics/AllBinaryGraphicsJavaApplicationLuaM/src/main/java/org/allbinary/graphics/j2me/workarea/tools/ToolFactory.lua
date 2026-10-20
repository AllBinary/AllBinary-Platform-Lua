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
-- package org.allbinary.graphics.j2me.workarea.tools

local StatusFactory = require("org.allbinary.graphics.j2me.StatusFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local ToolFactory = {}
ToolFactory.__index = ToolFactory
ToolFactory.className = "ToolFactory"

function ToolFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.selectedTool = nil
    self.tool = nil
    self.SELECTED_LABEL = "Selected: "
end

function ToolFactory.new()
    local self = setmetatable({}, ToolFactory)
    self:_init_fields()
    return self
end


function ToolFactory.getInstance()
        return ToolFactory.instance
end


function ToolFactory:setSelectedTool(tool)
        local try_ok, try_error = pcall(function()
            StatusFactory.getInstance():setStatus(self.SELECTED_LABEL .. tool)
            self.tool = tool
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setSelectionTool", e)
        end
end


function ToolFactory:getSelectedToolFactory()
        StatusFactory.getInstance():setStatus("Tool In Use: " .. self.tool)
        if self.tool ~= nil then
            self.selectedTool = GraphicItemFactory.getInstance():getInstance(self.tool)
            self.logUtil:putF("New Tool: " .. tostring(self.selectedTool), self, "getSelectedToolFactory")
            return self.selectedTool
        else
            return nil
        end
end

ToolFactory.instance = ToolFactory.new()

return ToolFactory

