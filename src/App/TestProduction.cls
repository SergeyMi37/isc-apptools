Class App.TestProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="App.TestProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="TestService" Category="" ClassName="Ens.MonitorService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="TestProcess" Category="" ClassName="Ens.Alerting.AlertManager" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="TestOperation" Category="" ClassName="Ens.Activity.Operation.REST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

