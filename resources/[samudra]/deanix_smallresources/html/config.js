const guidebookConfig = {
    defaultCategory: 'welcome.aboutUs', // Default open category
    defaultFont: 'Roboto', // Default font

    texts: {
        sidebarHeader: 'Categories',
        searchPlaceholder: 'Cari...',
        uiSettings: 'Pengaturan UI',
        uiSettingsDescription: 'Di sini Anda dapat menyesuaikan pengaturan UI.',
        changeTextSize: 'Ubah Ukuran Text:',
        searchBar: 'Pencarian:',
        selectFont: 'Pilih Font:',
        availableFonts: [
            'Roboto', 'Arial', 'Lato', 'Montserrat', 'Open Sans', 'Raleway', 'Poppins', 'Ubuntu', 'Merriweather', 'Oswald'
        ]
    },

    categories: {
        welcome: { // always unique
            title: 'Selamat Datang',
            icon: 'fas fa-home',
            subcategories: {
                aboutUs: { // always unique
                    title: 'Tentang Server Samudra',
                    icon: 'fas fa-info-circle',
                    content: `
                        <h3>Selamat Datang 😊</h3>
                        <p>Selamat Datang Di Samudra roleplay, Di sini Anda akan menemukan semua yang perlu Anda ketahui tentang cara bergabung dan apa yang bisa Anda harapkan dari server kami.</p>
                        <h3>Tentang Server</h3>
                        <p>Server kami menawarkan pengalaman bermain peran yang realistis dan menyenangkan. Tujuan kami adalah menyediakan lingkungan tempat para pemain dapat berkreasi dan berbagi cerita mereka..</p>
                        <h3>Guidebook</h3>
                        <p>Buku panduan ini berfungsi sebagai panduan bagi pemain baru maupun berpengalaman. Anda akan menemukan aturan, tutorial, dan informasi bermanfaat lainnya di sini.</p>
                        <h3>Links</h3>

                        <p><a href="javascript:openExternalLink('https://deanix-roleplay-webstore.tebex.io')">🌐 Website</a></p>
                        <p><a>💬 https://discord.gg/stBm3m66BU</a></p>
                        <p><strong>🆂🅰🅼🆄🅳🆁🅰:</strong> 🆁🅾🅻🅴🅿🅻🅰🆈</p>
                    `
                },
                rules: { // always unique
                    title: 'Rules',
                    icon: 'fas fa-gavel',
                    content: `
                        <h3>Server Rules 📜</h3>
                        <ul>
                            <li>1. Respect Other Players And Their Stories.</li>
                            <li>2. No Cheating Or Bug Abuse.</li>
                            <li>3. No RDM (Random Deathmatch) or VDM (Vehicle Deathmatch).</li>
                            <li>4. Stick To Roleplay Rules And Maintain Regular Presence.</li>
                            <li>5. Use Appropriate Language And Behavior.</li>
                            <li>6. No MIXING.</li>
                            <li>7. Forbidden To Interrupt The Story (Cut RP).</li>
                            <li>8. NOT REFUSE RP.</li>
                            <li>9. POWER GAMING.</li>
                            <li>10. Meta Gaming And Meta Story Prohibited (META GAMING & META RP).</li>
                            <li>11. REAL MONEY TRADING (RMT).</li>
                            <li>12. DOUBLE CHARACTER.</li>
                            <li>13. Do Not Commit Criminal Acts in the Green Zone.</li>
                        </ul>
                        <img src="https://cdn.gracza.pl/i_gp/h/22/406629492.jpg" alt="" style="width:100%; height:auto;"/>
                    `
                },
                laws: { // always unique
                    title: 'City Laws',
                    icon: 'fas fa-balance-scale',
                    content: `
                        <h3>Regulations 🏛️</h3>
                        <ul>
                            <li>1. Obey speed limits and traffic regulations.</li>
                            <li>2. Do not cross on red lights.</li>
                            <li>3. Do not park in prohibited areas.</li>
                            <li>4. No use of illegal substances.</li>
                            <li>5. Only carry weapons with proper permits.</li>
                        </ul>
                    `
                },
            }
        },
        tutorials: { // always unique
            title: 'Tutorials',
            icon: 'fas fa-book',
            subcategories: {
                keybinds: { // always unique
                    title: '🎮 Keybinds',
                    icon: false,
                    content: `
                        <h3>Shortcuts</h3>
                        <p>Here are the main keybinds you will need:</p>
                        <ul>
                            <li><strong>F1:</strong> Radial Menu.</li>
                            <li><strong>F2:</strong> Open inventory.</li>
                            <li><strong>F5:</strong> Emote Menu.</li>
                            <li><strong>F9:</strong> Documents Menu.</li>
                            <li><strong>F10:</strong> Scoreboard.</li>
                            <li><strong>Alt:</strong> Eye Target.</li>
                            <li><strong>M:</strong> Handphone.</li>
                            <li><strong>X:</strong> HandsUp.</li>
                            <li><strong>F:</strong> Getting in and out of the vehicle.</li>
                            <li><strong>B:</strong> Point / Seatbelt.</li>
                            <li><strong>P:</strong> Maps.</li>
                            <li><strong>Z:</strong> Setting the Sound Distance.</li>
                            <li><strong>T:</strong> Text Box.</li>
                            <li><strong>V:</strong> Point of View.</li>
                            <li><strong>R:</strong> Reload.</li>
                            <li><strong>Y:</strong> Cruise Control.</li>
                            <li><strong>':</strong> Push to Talk Radio | Handphone.</li>
                            <li><strong>CTRL:</strong> Crouch.</li>
                            <li><strong>/ooc:</strong> Used for speaking out of character, usually when you want to convey something important that is not related to roleplay. *please use wisely!.</li>
                            <li><strong>/me:</strong> Used to explain what our character is doing.</li>
                            <li><strong>/do:</strong> Used to describe the conditions around the character or the condition of the character himself.</li>
                            <li><strong>/reports:</strong> Used to report problems, violations or important incidents to the admin directly so that they can be followed up immediately.</li>
                            <li><strong>/job:</strong> View job info.</li>
                        </ul>
                        <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/keybindpng.png" alt="Keybinds" style="width:100%; height:auto;"/>
                    `
                },
               starterpack: {
               title: '🎁 Starterpack',
               icon: false,
               content: `
                    <h3>🎁 How to Claim Starter Pack:</h3>
                    <p>🎁 Go to the Starter Pack NPC or Location:</p>
                        <ol>
                            <li>🎁 Head to the South Rockford Drive on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_starterpackpng.png" alt="map starterpackpng" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🎁 Use Eye Muscle on the NPC Based on Your Character’s Gender</h4>
                        <ol>
                            <li>If your character is male, look at the male NPC and select “Claim Starterpack1” and “Claim Starterpack2” If your character is a woman, look for a female NPC and select “Claim Starterpack1” and “Claim Starterpack2”</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/npc_starterpackk.png" alt="NPC1" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/npc_starterpackkk.png" alt="NPC2" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🎁 Choose Your Free Vehicle</h4>
                        <ol>
                            <li>A menu will appear with several vehicle options. Select the one you want wisely—this is a one-time claim.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/menu_startterpack.png" alt="Menu1" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/menu_startterpackk.png" alt="Menu1" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🎁 Vehicle Will Spawn Automatically</h4>
                        <ol>
                            <li>After selecting, the vehicle will spawn nearby and be added to your garage or personal inventory.</li>
                        </ol>
                    `
                },
               deliverjob: {
               title: '📦 Job Delivery',
               icon: false,
               content: `
                    <h3>📦 How to Get a Job Delivery</h3>
                    <p>📦 Follow these steps to get a job:</p>
                        <ol>
                            <li>📦 How to Get the Delivery Job (Package Courier).</li>
                            <li>Go to the Job Center or the location marked as Delivery Job / Courier Job on the map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/delivery-map.png" alt="Package Courier" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>📦 Look at the NPC and Start the Job</h4>
                        <ol>
                            <li>Focus your eyes (eye muscle / third eye) on the nearby NPC, then select Start/Stop Service to activate the job.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/delivery_npc.png" alt="NPC" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>📦 Open the Task Menu via NPC</h4>
                        <ol>
                            <li>Use your eye muscle on the same NPC and select Open Tablet. Then, choose the task according to your level to start the delivery.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/delivery_tablet.png" alt="Open Tablet" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>📦 Get Your Vehicle & Package</h4>
                        <ol>
                            <li>Once the job is active, you’ll either be given a vehicle automatically or asked to pick it up at a specific location. Go to the pickup point to collect your package.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/package_delivery.png" alt="Package" style="width:100%; height:auto;" />
                    <h4>📦 Deliver to the Destination</h4>
                        <ol>
                            <li>Follow the GPS or map marker to deliver the package. Once delivered, you’ll receive a notification confirming success.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/dealivery_map2.png" alt="Destination" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/delivery_npc2.png" alt="Destination2" style="width:100%; height:auto;" />
                    <h4>📦 Repeat for More Earnings</h4>
                        <ol>
                            <li>After finishing a task, return and take on another one to keep earning money!.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/delivery_finish.png" alt="Earnings" style="width:100%; height:auto;" />
                    `
                },
               garbagejob: {
               title: '🗑️ Garbage Collector Job',
               icon: false,
               content: `
                    <h3>🗑️ How to Do the Garbage Collector Job</h3>
                    <p>🗑️ Follow these steps to get a job:</p>
                        <ol>
                            <li>🗑️ Go to the Job Center</li>
                            <li>Visit the job center or a marked location where you can get the Garbage Collector job.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/garbage_collector.png" alt="garbage collector" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🗑️ Use Eye Muscle on the NPC</h4>
                        <ol>
                            <li>Look at the NPC and select Toogle job duty to activate the garbage job.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/colector_npc.png" alt="colector npc" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🗑️ Open Task Menu</h4>
                        <ol>
                            <li>Focus your eye muscle again and choose Open Tablet, then pick a task based on your level.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/collector_tablet.png" alt="collector Tablet" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🗑️ Get the Garbage Truck</h4>
                        <ol>
                            <li>Once the task is selected, a garbage truck will spawn or you'll be directed to get one.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/collector_truck.png" alt="collector truck" style="width:100%; height:auto;" />
                    <h4>🗑️ Start Collecting Trash</h4>
                        <ol>
                            <li>Follow the GPS to trash pickup points. Exit the vehicle, pick up the trash bags, and load them into the truck.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/collector_map2.png" alt="collector map2" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/collector_pickup.png" alt="collector pickup" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/collector_pickup2.png" alt="collector pickup2" style="width:100%; height:auto;" />
                    <h4>🗑️ Finish the Route</h4>
                        <ol>
                            <li>After collecting all trash bags, head to the final drop-off point to complete the task.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/garbage_collector.png" alt="finish collector" style="width:100%; height:auto;" />
                    `
                },
               miningjob: {
               title: '⛏️ Mining Job',
               icon: false,
               content: `
                    <h3>⛏️ How to Do the Mining Job</h3>
                    <p>⛏️ Follow these steps to get a job:</p>
                        <ol>
                            <li>⛏️ Buy a Drill from the Nearest Hardware Store</li>
                            <li>Before starting, make sure to purchase a Drill from the nearest Hardware Store, as it’s required to mine materials.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_mining.png" alt="Maps Mining" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>⛏️ Go to the Mining Site</h4>
                        <ol>
                            <li>Head to the Mining Area marked on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/lokasi_mining.png" alt="Lokasi Mining" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>⛏️ Begin Mining Rocks</h4>
                        <ol>
                            <li>Equip your drill and begin mining rocks.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/mining_rock.png" alt="Mining Rock" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>⛏️ Go to the Washing Area</h4>
                        <ol>
                            <li>After mining, head to the location marked as Stone Washing on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/cucibatu.png" alt="cuci batu" style="width:100%; height:auto;" />
                    <h4>⛏️ Use Eye Muscle or Interaction Key</h4>
                        <ol>
                            <li>Focus your eye muscle (or press the interaction key) and select “Wash Stone”.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/cucibatu1.png" alt="cucibatu1" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/cucibatu2.png" alt="cucibatu2" style="width:100%; height:auto;" />
                    <h4>⛏️ Process Your Materials</h4>
                        <ol>
                            <li>Go to the Refinery or Processing Area to turn raw materials into refined goods, like copper, iron, gold or diamond.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_prosesbatu.png" alt="map prosesbatu" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/proses_batu.png" alt="prosesbatu" style="width:100%; height:auto;" />
                    <h4>⛏️ Sell Your Materials</h4>
                        <ol>
                            <li>Sell them at the Selling Point for profit.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellitem.png" alt="sellitem" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellitem2.png" alt="sellitem2" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellitem3.png" alt="sellitem3" style="width:100%; height:auto;" />
                    `
                },
               woodjob: {
               title: '🌲 Lumberjack Job',
               icon: false,
               content: `
                    <h3>🌲 How to Do the Woodcutter Job</h3>
                    <p>🌲 Follow these steps to get a job:</p>
                        <ol>
                            <li>🌲 Buy an Axe at the Hardware Store</li>
                            <li>Before starting, go to the nearest Hardware Store and purchase an axe, which is required for chopping trees.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_mining.png" alt="Maps wood" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>⛏️ Go to the Mining Site</h4>
                        <ol>
                            <li>Head to the Mining Area marked on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/lokasi_mining.png" alt="Lokasi Mining" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🌲 Go to the Lumberjack Area</h4>
                        <ol>
                            <li>Head to the location marked as Lumberjack / Woodcutting Zone on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/lokasi_kayu.png" alt="Lokasi Kayu" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🌲 Start Chopping Trees</h4>
                        <ol>
                            <li>Use the axe to chop down the trees. You’ll receive raw wood for each successful chop.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/tebang_kayu.png" alt="Tebang Kayu" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/tebang_kayu2.png" alt="Tebang Kayu2" style="width:100%; height:auto;" />
                    <h4>🌲 Bring Logs to the Processing Area</h4>
                        <ol>
                            <li>After collecting wood, go to the wood processing area to convert raw logs into processed planks.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/proseskayu.png" alt="proseskayu" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/proseskayu2.png" alt="proseskayu2" style="width:100%; height:auto;" />
                    <h4>🌲 Sell Your Materials</h4>
                        <ol>
                            <li>Processed wood can be sold at the Selling Point or used for crafting.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellitem.png" alt="sellitem" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellitem2.png" alt="sellitem2" style="width:100%; height:auto;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellitem3.png" alt="sellitem3" style="width:100%; height:auto;" />
                    `
                },
               hunting: {
               title: '🏹 Hunting Job:',
               icon: false,
               content: `
                    <h3>🏹 How to Do the Hunting Job:</h3>
                    <p>🏹 Buy a License:</p>
                        <ol>
                            <li>🏹 Go to the Police for a hunting license.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_police.png" alt="map police" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🏹 Head to the Hunting Area</h4>
                        <ol>
                            <li>Go to the hunting zone marked on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_hunting.png" alt="map hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🏹 Buy a Hunting Weapon and Start the Hunting Job</h4>
                        <ol>
                            <li>Use your eye muscle on the NPC to buy a hunting rifle and then select the Poultry First when you .</li>
                            <li> (For first-time hunters, it is recommended to select the Poultry task. It's easier, safer, and perfect for learning the basics before moving on to bigger game.).</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/npc_hutning.png" alt="npc hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🏹 Start Hunting</h4>
                        <ol>
                            <li>Head to the designated hunting area. Look around for your target (e.g. chickens. collect the animal using the interact key.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_chiken.png" alt="map hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🏹 Start Hunting</h4>
                        <ol>
                            <li>Head to the designated hunting area. Look around for your target (e.g. chickens. collect the animal using the interact key.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_chiken.png" alt="map hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/chiken_1.png" alt="chiken_1" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/chiken_2.png" alt="chiken_2" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🏹 Sell</h4>
                        <ol>
                            <li>Sell your products at the First Point. As you level up, you can unlock access to hunt larger animals like Pig, Deers, and more.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellhunting.png" alt="sellhunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    `
                },
               truckjob: {
               title: '🚍 Truck Job:',
               icon: false,
               content: `
                    <h3>🚍 Tutorial Kerja Truck:</h3>
                    <p>🚍 Kerja Truck:</p>
                        <ol>
                            <li>🚍 Silahkan ke koordinat 10108 temui warlok lalu otot mata ke warlok dan mulai kerja truk job.</li>
                        </ol>
                    <img src="https://media.discordapp.net/attachments/1425806072941379584/1425859137840877689/image.png" alt="map police" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://media.discordapp.net/attachments/1425806072941379584/1425859137840877689/image.png" alt="map police" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🚍 Head to the Hunting Area</h4>
                        <ol>
                            <li>Go to the hunting zone marked on your map.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_hunting.png" alt="map hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🚍 Buy a Hunting Weapon and Start the Hunting Job</h4>
                        <ol>
                            <li>Use your eye muscle on the NPC to buy a hunting rifle and then select the Poultry First when you .</li>
                            <li> (For first-time hunters, it is recommended to select the Poultry task. It's easier, safer, and perfect for learning the basics before moving on to bigger game.).</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/npc_hutning.png" alt="npc hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🚍 Start Hunting</h4>
                        <ol>
                            <li>Head to the designated hunting area. Look around for your target (e.g. chickens. collect the animal using the interact key.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_chiken.png" alt="map hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🚍 Start Hunting</h4>
                        <ol>
                            <li>Head to the designated hunting area. Look around for your target (e.g. chickens. collect the animal using the interact key.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/map_chiken.png" alt="map hunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/chiken_1.png" alt="chiken_1" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/chiken_2.png" alt="chiken_2" style="width:100%; height:auto; margin-bottom: 20px;" />
                    <h4>🚍 Sell</h4>
                        <ol>
                            <li>Sell your products at the First Point. As you level up, you can unlock access to hunt larger animals like Pig, Deers, and more.</li>
                        </ol>
                    <img src="https://r2.fivemanage.com/TiE6ranVo04nMKHvigw7T/sellhunting.png" alt="sellhunting" style="width:100%; height:auto; margin-bottom: 20px;" />
                    `
                },
            }
        },
        vip: { // always unique
            title: 'VIP',
            icon: 'fas fa-crown',
            subcategories: {
                howToBuy: { // always unique
                    title: '💎 How to Purchase VIP',
                    icon: false,
                    content: `
                        <h3>VIP Purchase Guide</h3>
                        <p>To purchase VIP, follow these steps:</p>
                        <ol>
                            <li>Visit our website: <a href="javascript:openExternalLink('https://sheenthebest.tebex.io')">🌐 Website</a></li>
                            <li>Go to the "Store" section.</li>
                            <li>Select the VIP package you want to purchase.</li>
                            <li>Complete the payment process.</li>
                            <li>After payment, your VIP status will be activated automatically.</li>
                        </ol>
                    `
                },
                vipBenefits: { // always unique
                    title: '✨ VIP Benefits',
                    icon: false,
                    content: `
                        <h3>Exclusive VIP Benefits</h3>
                        <p>As a VIP member, you will enjoy the following benefits:</p>
                        <ul>
                            <li>Access to exclusive areas and features.</li>
                            <li>Priority queue during peak times.</li>
                            <li>Special VIP-only events and activities.</li>
                            <li>Enhanced in-game rewards and bonuses.</li>
                            <li>Unique VIP badge and recognition.</li>
                            <li>VIP Dealership Access</li>
                        </ul>
                        <img src="https://wallpapers.com/images/hd/fivem-zhg48vbp6zfjz15i.jpg" alt="" style="width:100%; height:auto;"/>
                    `
                },
            }
        },

        test: { // always unique
            title: 'Example',
            icon: 'fas fa-info-circle',
            content: `
                Example
            `
        },
    }
};
