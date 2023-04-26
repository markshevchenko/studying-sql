open System

let random = new Random()

let is_valid_ip = function
    | 0, 0, 0, 0 -> false
    | 255, 255, 255, 255 -> false
    | 127, 0, 0, _ -> false
    | 10, _, _, _ -> false
    | 172, b2, _, _ when b2 >= 16 && b2 <= 31 -> false
    | 192, 168, 0, _ -> false
    | _ -> true

let rec generate_ip () =
    let b1 = random.Next(0, 256)
    let b2 = random.Next(0, 256)
    let b3 = random.Next(0, 256)
    let b4 = random.Next(0, 256)

    if is_valid_ip (b1, b2, b3, b4)
    then $"{b1}.{b2}.{b3}.{b4}"
    else generate_ip ()

let ips = Array.init 10_000 (fun _ -> generate_ip ())

let make_path_status i =
    let path = $"path/to/file-%02d{i}.txt"
    let status =
        if i % 99 = 0 then 500
        elif i % 49 = 0 then 302
        elif i % 19 = 0 then 404
        else 200

    (path, status)

let path_statuses = Array.init 100 make_path_status
let methods = [| ("GET", 75); ("POST", 95); ("DELETE", 100) |]

let max = fsi.CommandLineArgs
       |> Array.tryItem 1
       |> Option.bind (fun arg -> match Int32.TryParse(arg) with
                                  | (true, value) -> Some value
                                  | (false, _) -> None)
       |> Option.defaultValue 100

printfn "id,clientIP,requestTime,httpMethod,path,status"
let mutable requestTime = new DateTime(2023, 4, 1, 0, 0, 0)
for id in 1..max do
    let clientIP = ips[random.Next(ips.Length)]
    let random100 = random.Next(100)
    let httpMethod = methods
                  |> Array.find (fun (_, limit) -> random100 < limit)
                  |> fst
    let path, status = path_statuses[random.Next(path_statuses.Length)]
    printfn $"{id},{clientIP},{requestTime:O},{httpMethod},{path},{status}"
    requestTime <- requestTime.AddSeconds(random.NextDouble())

// PS> Measure-Command { dotnet fsi generate-csv.fsx 10000000 > log.csv }
// 
// Days              : 0
// Hours             : 0
// Minutes           : 7
// Seconds           : 4
// Milliseconds      : 890
// Ticks             : 4248907137
// TotalDays         : 0,00491771659375
// TotalHours        : 0,11802519825
// TotalMinutes      : 7,081511895
// TotalSeconds      : 424,8907137
// TotalMilliseconds : 424890,7137
