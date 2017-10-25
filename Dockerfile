FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /src

COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app/

FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "HerokuTest.dll"]