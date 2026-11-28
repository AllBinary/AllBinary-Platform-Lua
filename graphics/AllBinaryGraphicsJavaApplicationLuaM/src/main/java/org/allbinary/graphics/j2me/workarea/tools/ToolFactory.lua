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

local ToolFactory = {}
package.loaded["org.allbinary.graphics.j2me.workarea.tools.ToolFactory"] = ToolFactory

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

local StatusFactory = java_lazy("org.allbinary.graphics.j2me.StatusFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GraphicItemFactory = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicItemFactory")
local GraphicsItemInterfaceFactoryInterface = java_lazy("org.allbinary.graphics.j2me.workarea.tools.GraphicsItemInterfaceFactoryInterface")

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

-- class table ToolFactory is declared before the requires
ToolFactory.__index = ToolFactory
ToolFactory.className = "ToolFactory"
ToolFactory.javaClassName = "org.allbinary.graphics.j2me.workarea.tools.ToolFactory"

function ToolFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.selectedTool = nil
    self.tool = nil
    self.SELECTED_LABEL = "Selected: "
end

function ToolFactory._jinit(self)
    ToolFactory._init_fields(self)
    return self
end

function ToolFactory.new()
    return ToolFactory._jinit(setmetatable({}, ToolFactory))
end


function ToolFactory.getInstance()
        return ToolFactory.instance_f
end


function ToolFactory:setSelectedTool(tool)
        local try_ok, try_error, try_value = pcall(function()
            StatusFactory.getInstance():setStatus(require("allbinary_java").to_string(self.SELECTED_LABEL) .. require("allbinary_java").to_string(tool))
            self.tool = tool
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setSelectionTool", e)
        end
end


function ToolFactory:getSelectedToolFactory()
        StatusFactory.getInstance():setStatus(require("allbinary_java").to_string("Tool In Use: ") .. require("allbinary_java").to_string(self.tool))
        if not rawequal(self.tool, nil) then
            self.selectedTool = GraphicItemFactory.getInstance():getInstance(self.tool)
            self.logUtil:putF(require("allbinary_java").to_string("New Tool: ") .. require("allbinary_java").to_string(self.selectedTool), self, "getSelectedToolFactory")
            return self.selectedTool
        else
            return nil
        end
end

ToolFactory.instance_f = ToolFactory.new()

return ToolFactory

