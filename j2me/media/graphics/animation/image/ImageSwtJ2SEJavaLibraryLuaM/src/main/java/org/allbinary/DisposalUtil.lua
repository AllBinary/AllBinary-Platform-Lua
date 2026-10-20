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

-- local Image = require("javax.microedition.lcdui.Image")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Resource = require("org.eclipse.swt.graphics.Resource")
local SwtMutableImage = require("org.microemu.device.swt.SwtMutableImage")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DisposalUtil = {}
DisposalUtil.__index = DisposalUtil
DisposalUtil.className = "DisposalUtil"

function DisposalUtil:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function DisposalUtil.new()
    local self = setmetatable({}, DisposalUtil)
    self:_init_fields()
    return self
end


function DisposalUtil.getInstance()
        return DisposalUtil.instance
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

DisposalUtil.instance = DisposalUtil.new()

return DisposalUtil

