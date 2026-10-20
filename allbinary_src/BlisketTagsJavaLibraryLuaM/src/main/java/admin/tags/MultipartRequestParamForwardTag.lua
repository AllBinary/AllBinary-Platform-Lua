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
-- package admin.tags

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local Tag = require("javax.servlet.jsp.tagext.Tag")
local MultipartRequestParamForwardHelper = require("admin.taghelpers.MultipartRequestParamForwardHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CustomTagSupport = require("tags.CustomTagSupport")
local HelperTag = require("tags.HelperTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultipartRequestParamForwardTag = {}
MultipartRequestParamForwardTag.__index = MultipartRequestParamForwardTag
MultipartRequestParamForwardTag.className = "MultipartRequestParamForwardTag"
setmetatable(MultipartRequestParamForwardTag, {__index = CustomTagSupport})

function MultipartRequestParamForwardTag:_init_fields()
    self.page = nil
    self.command = nil
    self.paramVector = nil
end

function MultipartRequestParamForwardTag.new()
    local self = setmetatable(CustomTagSupport.new(), MultipartRequestParamForwardTag)
    self:_init_fields()
    return self
end


function MultipartRequestParamForwardTag:setPage(page)
        self.page = page
end


function MultipartRequestParamForwardTag:setCommand(command)
        self.command = command
end


function MultipartRequestParamForwardTag:setParamVector(paramVector)
        self.paramVector = paramVector
end


-- throws JspTagException
function MultipartRequestParamForwardTag:doStartTag()
        local try_ok, try_error = pcall(function()
            local parentTag = self:getParent()
            ParentInventoryTagHelper.getInstance():isValid(self, parentTag)
            local hashMap = StdUtil.getInstance():createHashMap()
            hashMap:put(AbTagData.PARENT, parentTag)
            local multipartRequestParamForwardHelper = MultipartRequestParamForwardHelper.new(parentTag, self.page, self.command, self.paramVector, self.pageContext)
            multipartRequestParamForwardHelper:forward()
            return Tag.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return Tag.SKIP_BODY
        end
end

return MultipartRequestParamForwardTag

