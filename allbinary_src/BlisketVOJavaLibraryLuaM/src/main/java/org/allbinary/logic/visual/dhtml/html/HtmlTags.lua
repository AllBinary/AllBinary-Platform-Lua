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
-- package org.allbinary.logic.visual.dhtml.html

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HtmlTags = {}
HtmlTags.__index = HtmlTags
HtmlTags.className = "HtmlTags"

function HtmlTags:_init_fields()
    self.htmlTagVector = nil
end


function HtmlTags.new()
    local self = setmetatable({}, HtmlTags)
    self:_init_fields()
        self.htmlTagVector = BasicArrayListD.new()
    return self
end


function HtmlTags:get(index)
        return self.htmlTagVector:get(index)
end


function HtmlTags:add(htmlTag)
        self.htmlTagVector:add(htmlTag)
end


function HtmlTags:size()
        return self.htmlTagVector:size()
end

return HtmlTags

