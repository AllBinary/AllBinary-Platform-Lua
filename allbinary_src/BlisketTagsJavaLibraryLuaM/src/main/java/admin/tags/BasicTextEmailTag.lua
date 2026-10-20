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

-- local Method = require("java.lang.reflect.Method")
-- local HashMap = require("java.util.HashMap")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local BasicTextEmailHelperFactory = require("admin.taghelpers.BasicTextEmailHelperFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CustomTagSupport = require("tags.CustomTagSupport")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicTextEmailTag = {}
BasicTextEmailTag.__index = BasicTextEmailTag
BasicTextEmailTag.className = "BasicTextEmailTag"
setmetatable(BasicTextEmailTag, {__index = CustomTagSupport})

function BasicTextEmailTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.subject = nil
    self.body = nil
end


function BasicTextEmailTag.new()
    local self = setmetatable(CustomTagSupport.new(), BasicTextEmailTag)
    self:_init_fields()
    return self
end


function BasicTextEmailTag:setSubject(value)
        self.subject = value
end


function BasicTextEmailTag:setBody(value)
        self.body = value
end


function BasicTextEmailTag:send()
        local try_ok, try_error = pcall(function()
            local propertiesHashMap = StdUtil.getInstance():createHashMap()
            propertiesHashMap:put("Subject", self.subject)
            propertiesHashMap:put("Body", self.body)
            local anyType = BasicTextEmailHelperFactory.new():getInstance(propertiesHashMap, self.pageContext)
            local method = getmetatable(anyType):getMethod("send", nil)
            method:invoke(anyType, nil)
            return "Email Sent"
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to Send Email."
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "send()", e)
            end
            return error
        end
end


-- throws JspTagException
function BasicTextEmailTag:doStartTag()
        local try_ok, try_error = pcall(function()
            self.pageContext:getOut():print(self:send())
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return BasicTextEmailTag

