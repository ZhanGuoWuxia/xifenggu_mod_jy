using Bright.Serialization;
using SimpleJSON;
using ZhanGuoWuxia.Backend.Beans;
using System.Collections.Generic;
using System;

{{
    name = x.name
    namespace = x.namespace
    tables = x.tables
}}
namespace {{namespace}}
{
   
public sealed partial class {{name}}
{

    private readonly Dictionary<Type, ITable> m_Tables = new Dictionary<Type, ITable>();

    public Tables(){}

    public {{name}}(System.Func<string, JSONNode> loader)
    {
        Reload(loader);
    }

    public void Reload(System.Func<string, JSONNode> loader)
    {
        Clear();
        var tables = new System.Collections.Generic.Dictionary<string, object>();
        {{~for table in tables ~}}
        var {{table.name}} = new {{table.full_name}}(loader("{{table.output_data_file}}")); 
        tables.Add("{{table.full_name}}", {{table.name}});
        m_Tables.Add(typeof({{table.value_type}}), {{table.name}});
        {{~end~}}
        PostInit();

        foreach(var t in m_Tables.Values)
            t.Resolve(tables);
        PostResolve();
    }

    public void TranslateText(System.Func<string, string, string> translator)
    {
        foreach(var t in m_Tables.Values)
            t.TranslateText(translator);
    }

    public void Clear()
    {
        m_Tables.Clear();
    }
    
    partial void PostInit();
    partial void PostResolve();
}

}
