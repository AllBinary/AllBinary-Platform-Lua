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
-- package org.allbinary

local DisposalUtil = {}
package.loaded["org.allbinary.DisposalUtil"] = DisposalUtil

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

-- local Image = require("javax.microedition.lcdui.Image")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Resource = java_lazy("org.eclipse.swt.graphics.Resource")
local SwtMutableImage = java_lazy("org.microemu.device.swt.SwtMutableImage")

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

-- class table DisposalUtil is declared before the requires
DisposalUtil.__index = DisposalUtil
DisposalUtil.className = "DisposalUtil"
DisposalUtil.javaClassName = "org.allbinary.DisposalUtil"

function DisposalUtil:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function DisposalUtil._jinit(self)
    DisposalUtil._init_fields(self)
    return self
end

function DisposalUtil.new()
    return DisposalUtil._jinit(setmetatable({}, DisposalUtil))
end


function DisposalUtil.getInstance()
        return DisposalUtil.instance_f
end


function DisposalUtil:disposeImage(image)
        if image == nil then
            return
        end
        if image:isMutable() then
            local mutableImage = image
            self:disposeResource(mutableImage:getImage())
        else
        end
end


function DisposalUtil:disposeResource(resource)
        if not resource:isDisposed() then
            print(self.commonStrings.CLOSE)
            resource:dispose()
        end
end

DisposalUtil.instance_f = DisposalUtil.new()

return DisposalUtil

