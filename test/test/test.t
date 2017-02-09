function 按钮0_点击()
    //这里添加你要执行的代码
    var option= combogettext("下拉框0")
    var input = editgettext("编辑框0")
    
    if(strfind(option,"startlocal") != -1)
        option = "http://www.startlocal.com.au/cgi-bin/directory/search.cgi?query="&urlencode(input,"utf-8")&"&query2="
    end
    
    webgo("浏览器0", option)
end

function 按钮1_点击()
    //这里添加你要执行的代码
    exit()
end

功能 test_初始化()
    //这里添加你要执行的代码
    
结束

功能 按钮2_点击()
    //这里添加你要执行的代码
    var option= combogettext("下拉框0")
    if(strfind(option,"startlocal") != -1)
        var len = webgetcount("浏览器0","tag:p&class:info")
        //var phone_len = webgetcount("浏览器0","tag:a&class:obscured-phone")
        var result = ""
        for(var i = 0; i < len; i++)
            var addr = webhtmlget("浏览器0","innerHtml","tag:p&class:info&index:"&i)
            if(strlen(addr) == 0)
                continue
            end
            //webhtmlclick("浏览器0","class:obscured-phone&index:"&i)
            //var phone = webhtmlget("浏览器0","outerHtml","class:obscured-phone&index:"&i)
            //messagebox(phone)
            //phone = strreplace(phone,"Z","")
            result = strcat(result, addr&"\r\n") 
        end
        
        if(strlen(result) < 1)
            messagebox("暂无数据")
            return
        end
        editsettext("编辑框1",result) 
    end
结束


功能 按钮3_点击()
    //这里添加你要执行的代码
    var dir = sysgetprocesspath()
    var fd=filecreate(dir&"result.txt","CREATE_ALWAYS|rw") 
    var result = editgettext("编辑框1")
    
    if(strlen(result) < 1)
        messagebox("请先搜索提取再导出")
        return
    end
    filewrite(fd, result) 
    fileclose(fd) 
结束
